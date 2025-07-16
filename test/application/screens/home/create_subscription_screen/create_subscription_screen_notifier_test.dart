import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';
import 'package:dogfydiet_app/domain/services/subscription_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_subscription_screen_notifier_test.mocks.dart';

@GenerateMocks([SubscriptionService])
void main() {
  late MockSubscriptionService mockSubscriptionService;
  late ProviderContainer container;

  setUp(() {
    mockSubscriptionService = MockSubscriptionService();
    container = ProviderContainer(
      overrides: [
        subscriptionServiceProvider.overrideWithValue(mockSubscriptionService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CreateSubscriptionScreenNotifier', () {
    test('should return initial state', () {
      final state = container.read(createSubscriptionScreenNotifierProvider);

      expect(state.form, const SubscriptionForm());
      expect(state.isLoading, false);
      expect(state.error, isNull);
      expect(state.isSubmitting, false);
    });

    test('should load progress successfully', () async {
      const savedForm = SubscriptionForm(
        selectedBreed: DogBreed(id: 1, name: {'en': 'Labrador'}),
        petName: 'Max',
        currentStep: 1,
      );
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => savedForm);

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.selectedBreed, savedForm.selectedBreed);
      expect(state.form.petName, savedForm.petName);
      expect(state.isLoading, false);
      expect(state.error, isNull);
      verify(mockSubscriptionService.getProgress()).called(2);
    });

    test('should handle null progress', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form, const SubscriptionForm());
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('should handle error when loading progress', () async {
      const errorMessage = 'Network error';
      when(mockSubscriptionService.getProgress()).thenThrow(Exception(errorMessage));

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form, const SubscriptionForm());
      expect(state.isLoading, false);
      expect(state.error, contains(errorMessage));
    });

    test('should update breed', () async {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador'});
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updateBreed(breed);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.selectedBreed, breed);
      verify(mockSubscriptionService.saveProgress(any)).called(1);
    });

    test('should update pet name', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetName('Max');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petName, 'Max');
      verify(mockSubscriptionService.saveProgress(any)).called(1);
    });

    test('should trim pet name and handle empty string', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      notifier.updatePetName('  Max  ');
      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petName, 'Max');

      notifier.updatePetName('   ');
      final stateAfterEmpty = container.read(createSubscriptionScreenNotifierProvider);
      expect(stateAfterEmpty.form.petName, 'Max');
    });

    test('should update pet gender', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetGender('male');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petGender, 'male');
    });

    test('should update pet neutered status', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetNeutered(true);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petNeutered, true);
    });

    test('should update pet pregnant or lactating status', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetPregnantOrLactating(true);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petPregnantOrLactating, true);
    });

    test('should update pet birth date', () async {
      final birthDate = DateTime(2023, 1, 1);
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetBirthDate(birthDate);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petBirthDate, birthDate);
    });

    test('should update step when birth date changes puppy status', () async {
      final puppyBirthDate = DateTime.now().subtract(const Duration(days: 100));

      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      notifier.goToStep(SubscriptionForm.stepAdultWeightSilhouette);
      notifier.updatePetBirthDate(puppyBirthDate);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.currentStep, SubscriptionForm.stepPuppyWeight);
    });

    test('should update pet silhouette', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetSilhouette('normal');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petSilhouette, 'normal');
    });

    test('should update pet weight', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetWeight(25.5);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.petWeight, 25.5);
    });

    test('should update activity level', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updateActivityLevel('high');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.activityLevel, 'high');
    });

    test('should update health conditions', () async {
      const conditions = ['diabetes', 'arthritis'];
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updateHealthConditions(conditions);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.healthConditions, conditions);
    });

    test('should update food preferences', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updateFoodPreferences('gourmet');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.foodPreferences, 'gourmet');
    });

    test('should update owner email', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updateOwnerEmail('test@example.com');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.ownerEmail, 'test@example.com');
    });

    test('should update owner phone', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updateOwnerPhone('123456789');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.ownerPhone, '123456789');
    });

    test('should navigate to next step', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.nextStep();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.currentStep, SubscriptionForm.stepPetName);
    });

    test('should navigate to previous step', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.nextStep();
      notifier.previousStep();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.currentStep, SubscriptionForm.stepBreedSelection);
    });

    test('should go to specific step', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.goToStep(SubscriptionForm.stepPetGender);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.currentStep, SubscriptionForm.stepPetGender);
    });

    test('should not go to disabled step', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.goToStep(999);

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.currentStep, SubscriptionForm.stepBreedSelection);
    });

    test('should check if can go next', () async {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador'});
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      expect(notifier.canGoNext(), false);

      notifier.updateBreed(breed);
      expect(notifier.canGoNext(), true);
    });

    test('should check if can go previous', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      expect(notifier.canGoPrevious(), false);

      notifier.nextStep();
      expect(notifier.canGoPrevious(), true);
    });

    test('should get current page index', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      expect(notifier.currentPageIndex, 0);

      notifier.goToStep(SubscriptionForm.stepPetName);
      expect(notifier.currentPageIndex, 1);

      notifier.goToStep(SubscriptionForm.stepPetGender);
      expect(notifier.currentPageIndex, 2);
    });

    test('should complete subscription successfully', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});
      when(mockSubscriptionService.submitForm(any)).thenAnswer((_) async {});
      when(mockSubscriptionService.clearProgress()).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      await notifier.completeSubscription();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form, const SubscriptionForm());
      expect(state.isSubmitting, false);
      expect(state.error, isNull);
      verify(mockSubscriptionService.submitForm(any)).called(1);
      verify(mockSubscriptionService.clearProgress()).called(1);
    });

    test('should handle error when completing subscription', () async {
      const errorMessage = 'Submit error';
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});
      when(mockSubscriptionService.submitForm(any)).thenThrow(Exception(errorMessage));

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      await notifier.completeSubscription();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.isSubmitting, false);
      verify(mockSubscriptionService.submitForm(any)).called(1);
    });

    test('should clear progress', () async {
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});
      when(mockSubscriptionService.clearProgress()).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      await notifier.clearProgress();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form, const SubscriptionForm());
      verify(mockSubscriptionService.clearProgress()).called(1);
    });

    test('should handle error when clearing progress', () async {
      const errorMessage = 'Clear error';
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});
      when(mockSubscriptionService.clearProgress()).thenThrow(Exception(errorMessage));

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      await notifier.clearProgress();

      verify(mockSubscriptionService.clearProgress()).called(1);
    });

    test('should clear error', () async {
      when(mockSubscriptionService.getProgress()).thenThrow(Exception('Error'));

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.clearError();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.error, isNull);
    });

    test('should handle save progress error', () async {
      const errorMessage = 'Save error';
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => null);
      when(mockSubscriptionService.saveProgress(any)).thenThrow(Exception(errorMessage));

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();
      notifier.updatePetName('Max');

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.error, contains(errorMessage));
    });

    test('should validate current step correctly for disabled step', () async {
      const form = SubscriptionForm(
        currentStep: 999,
        selectedBreed: DogBreed(id: 1, name: {'en': 'Labrador'}),
      );
      when(mockSubscriptionService.getProgress()).thenAnswer((_) async => form);
      when(mockSubscriptionService.saveProgress(any)).thenAnswer((_) async {});

      final notifier = container.read(createSubscriptionScreenNotifierProvider.notifier);
      await notifier.loadProgress();

      final state = container.read(createSubscriptionScreenNotifierProvider);
      expect(state.form.currentStep, SubscriptionForm.stepBreedSelection);
    });
  });

  group('CreateSubscriptionScreenState', () {
    test('should create state with default values', () {
      const state = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      expect(state.form, const SubscriptionForm());
      expect(state.isLoading, false);
      expect(state.error, isNull);
      expect(state.isSubmitting, false);
    });

    test('should create new state with copyWith', () {
      const initialState = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      const newForm = SubscriptionForm(petName: 'Max');
      final newState = initialState.copyWith(
        form: newForm,
        isLoading: true,
        error: 'Test error',
        isSubmitting: true,
      );

      expect(newState.form, newForm);
      expect(newState.isLoading, true);
      expect(newState.error, 'Test error');
      expect(newState.isSubmitting, true);
    });

    test('should clear error with copyWith null', () {
      const initialState = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: 'Test error',
        isSubmitting: false,
      );

      final newState = initialState.copyWith(error: null);

      expect(newState.error, isNull);
    });

    test('should support equality', () {
      const state1 = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      const state2 = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      expect(state1, equals(state2));
    });

    test('should support inequality', () {
      const state1 = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      const state2 = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: true,
        error: null,
        isSubmitting: false,
      );

      expect(state1, isNot(equals(state2)));
    });
  });
}