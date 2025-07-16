import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/application/widgets/breed_selector/breed_selector_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';
import 'package:dogfydiet_app/ui/screens/home/create_subscription_screen/create_subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/create_test_widget_with_localizations.dart';

const mockBreed = DogBreed(
  id: 1,
  name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'},
);

const mockBreeds = [
  DogBreed(id: 1, name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'}),
  DogBreed(id: 2, name: {'en': 'Labrador', 'es': 'Labrador'}),
];

final mockSubscriptionForm = SubscriptionForm(
  selectedBreed: mockBreed,
  petName: 'Max',
  petGender: 'male',
  petNeutered: true,
  petBirthDate: DateTime(2022, 1, 1),
  petWeight: 25.0,
  activityLevel: 'medium',
  foodPreferences: 'gourmet',
  ownerEmail: 'test@example.com',
  ownerPhone: '123456789',
  currentStep: SubscriptionForm.stepBreedSelection,
  isCompleted: false,
);

final mockSubscriptionState = CreateSubscriptionScreenState(
  form: mockSubscriptionForm,
  isLoading: false,
  error: null,
  isSubmitting: false,
);

const mockBreedSelectorState = BreedSelectorState(
  breeds: mockBreeds,
  selectedBreed: mockBreed,
  isLoading: false,
  error: null,
);

void main() {
  group('CreateSubscriptionScreen Tests', () {
    Widget createTestWidget({
      CreateSubscriptionScreenState? subscriptionState,
      BreedSelectorState? breedState,
    }) {
      return ProviderScope(
        overrides: [
          createSubscriptionScreenNotifierProvider.overrideWith(
            () => _TestCreateSubscriptionScreenNotifier(
              subscriptionState ?? mockSubscriptionState,
            ),
          ),
          breedSelectorNotifierProvider.overrideWith(
            () => _TestBreedSelectorNotifier(
              breedState ?? mockBreedSelectorState,
            ),
          ),
        ],
        child: createTestWidgetWithLocalizations(
          child: const CreateSubscriptionScreen(),
        ),
      );
    }

    testWidgets('should render screen without errors', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.byType(CreateSubscriptionScreen), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display progress bar', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(
          find.byWidgetPredicate(
            (widget) => widget is Container && widget.decoration != null,
          ),
          findsAtLeastNWidgets(1));
    });

    testWidgets('should display navigation buttons', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should display breed selection step', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('✏️'), findsOneWidget);
      expect(find.textContaining('breed'), findsAtLeastNWidgets(1));
      expect(find.text('🐕'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display pet name step', (WidgetTester tester) async {
      final formOnNameStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepPetName,
      );
      final stateOnNameStep = mockSubscriptionState.copyWith(form: formOnNameStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnNameStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('✏️'), findsOneWidget);
    });

    testWidgets('should display pet gender step', (WidgetTester tester) async {
      final formOnGenderStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepPetGender,
      );
      final stateOnGenderStep = mockSubscriptionState.copyWith(form: formOnGenderStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnGenderStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('Male'), findsOneWidget);
      expect(find.text('Female'), findsOneWidget);
      expect(find.text('🤔'), findsOneWidget);
    });

    testWidgets('should display birth date step', (WidgetTester tester) async {
      final formOnBirthStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepBirthDate,
      );
      final stateOnBirthStep = mockSubscriptionState.copyWith(form: formOnBirthStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnBirthStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.byType(DropdownButtonFormField<int>), findsAtLeastNWidgets(1));
      expect(find.text('🎂'), findsOneWidget);
    });

    testWidgets('should display activity level step', (WidgetTester tester) async {
      final formOnActivityStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepActivityLevel,
      );
      final stateOnActivityStep = mockSubscriptionState.copyWith(form: formOnActivityStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnActivityStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('😴'), findsOneWidget);
      expect(find.text('🐕'), findsAtLeastNWidgets(1));
      expect(find.text('🏃‍♂️'), findsOneWidget);
    });

    testWidgets('should display food preferences step', (WidgetTester tester) async {
      final formOnFoodStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepFoodPreferences,
      );
      final stateOnFoodStep = mockSubscriptionState.copyWith(form: formOnFoodStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnFoodStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('🤢'), findsOneWidget);
      expect(find.text('😋'), findsOneWidget);
      expect(find.textContaining('food'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display health conditions step', (WidgetTester tester) async {
      final formOnHealthStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepHealthConditions,
      );
      final stateOnHealthStep = mockSubscriptionState.copyWith(form: formOnHealthStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnHealthStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('❤️'), findsOneWidget);
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);
    });

    testWidgets('should display owner details step', (WidgetTester tester) async {
      final formOnOwnerStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepOwnerDetails,
      );
      final stateOnOwnerStep = mockSubscriptionState.copyWith(form: formOnOwnerStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnOwnerStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('👍'), findsOneWidget);
      expect(find.byType(TextField), findsAtLeastNWidgets(2));
      expect(find.byIcon(Icons.email_outlined), findsOneWidget);
    });

    testWidgets('should handle continue button tap', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      final continueButton = find.text('Continue');
      expect(continueButton, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display back button when not on first step', (WidgetTester tester) async {
      final formOnSecondStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepPetName,
      );
      final stateOnSecondStep = mockSubscriptionState.copyWith(form: formOnSecondStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnSecondStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.text('Back'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('should handle back button tap', (WidgetTester tester) async {
      final formOnSecondStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepPetName,
      );
      final stateOnSecondStep = mockSubscriptionState.copyWith(form: formOnSecondStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnSecondStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      final backButton = find.text('Back');
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display loading state', (WidgetTester tester) async {
      const loadingState = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: true,
        error: null,
        isSubmitting: false,
      );

      await tester.pumpWidget(createTestWidget(subscriptionState: loadingState));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('should handle text input in name step', (WidgetTester tester) async {
      final formOnNameStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepPetName,
        petName: null,
      );
      final stateOnNameStep = mockSubscriptionState.copyWith(form: formOnNameStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnNameStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      await tester.enterText(textField, 'Test Dog');
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle dropdown selection in birth date step', (WidgetTester tester) async {
      final formOnBirthStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepBirthDate,
        petBirthDate: null,
      );
      final stateOnBirthStep = mockSubscriptionState.copyWith(form: formOnBirthStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnBirthStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      final dropdown = find.byType(DropdownButtonFormField<int>).first;
      expect(dropdown, findsOneWidget);

      await tester.tap(dropdown);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should be scrollable within steps', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      final pageView = find.byType(PageView);
      expect(pageView, findsOneWidget);

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display breed selector', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
      expect(find.textContaining('Golden Retriever'), findsOneWidget);
    });

    testWidgets('should have proper widget structure', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      expect(find.byType(CreateSubscriptionScreen), findsOneWidget);
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Container), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle different form validation states', (WidgetTester tester) async {
      final invalidForm = SubscriptionForm(
        currentStep: SubscriptionForm.stepBreedSelection,
      );
      final invalidState = CreateSubscriptionScreenState(
        form: invalidForm,
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      await tester.pumpWidget(createTestWidget(subscriptionState: invalidState));
      await tester.pump();
      await tester.pump(Duration.zero);

      final continueButton = find.byType(ElevatedButton);
      expect(continueButton, findsOneWidget);

      final buttonWidget = tester.widget<ElevatedButton>(continueButton);
      expect(buttonWidget.onPressed, isNull);
    });

    testWidgets('should handle breed selector tap', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      await tester.pump(Duration.zero);

      final breedSelector = find
          .byWidgetPredicate(
            (widget) => widget is GestureDetector,
          )
          .first;

      await tester.tap(breedSelector, warnIfMissed: false);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle activity level selection', (WidgetTester tester) async {
      final formOnActivityStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepActivityLevel,
      );
      final stateOnActivityStep = mockSubscriptionState.copyWith(form: formOnActivityStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnActivityStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      final activityButton = find.text('😴');
      await tester.tap(activityButton, warnIfMissed: false);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle gender button selection', (WidgetTester tester) async {
      final formOnGenderStep = mockSubscriptionForm.copyWith(
        currentStep: SubscriptionForm.stepPetGender,
      );
      final stateOnGenderStep = mockSubscriptionState.copyWith(form: formOnGenderStep);

      await tester.pumpWidget(createTestWidget(subscriptionState: stateOnGenderStep));
      await tester.pump();
      await tester.pump(Duration.zero);

      final maleButton = find.text('Male');
      await tester.tap(maleButton, warnIfMissed: false);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}

class _TestCreateSubscriptionScreenNotifier extends CreateSubscriptionScreenNotifier {
  final CreateSubscriptionScreenState _mockState;

  _TestCreateSubscriptionScreenNotifier(this._mockState);

  @override
  CreateSubscriptionScreenState build() => _mockState;

  @override
  Future<void> loadProgress() async {}

  @override
  Future<void> saveProgress() async {}

  @override
  void updateBreed(DogBreed breed) {}

  @override
  void updatePetName(String name) {}

  @override
  void updatePetGender(String gender) {}

  @override
  void updatePetNeutered(bool neutered) {}

  @override
  void updatePetPregnantOrLactating(bool? pregnantOrLactating) {}

  @override
  void updatePetBirthDate(DateTime birthDate) {}

  @override
  void updatePetSilhouette(String silhouette) {}

  @override
  void updatePetWeight(double weight) {}

  @override
  void updateActivityLevel(String activityLevel) {}

  @override
  void updateHealthConditions(List<String> conditions) {}

  @override
  void updateFoodPreferences(String preferences) {}

  @override
  void updateOwnerEmail(String email) {}

  @override
  void updateOwnerPhone(String phone) {}

  @override
  void nextStep() {}

  @override
  void previousStep() {}

  @override
  void goToStep(int step) {}

  @override
  bool canGoNext() => _mockState.form.isCurrentStepValid();

  @override
  bool canGoPrevious() => _mockState.form.previousStepIndex != null;

  @override
  int get currentPageIndex {
    switch (_mockState.form.currentStep) {
      case SubscriptionForm.stepBreedSelection:
        return 0;
      case SubscriptionForm.stepPetName:
        return 1;
      case SubscriptionForm.stepPetGender:
        return 2;
      case SubscriptionForm.stepBirthDate:
        return 3;
      case SubscriptionForm.stepAdultWeightSilhouette:
        return 4;
      case SubscriptionForm.stepPuppyWeight:
        return 5;
      case SubscriptionForm.stepActivityLevel:
        return 6;
      case SubscriptionForm.stepHealthConditions:
        return 7;
      case SubscriptionForm.stepFoodPreferences:
        return 8;
      case SubscriptionForm.stepOwnerDetails:
        return 9;
      default:
        return 0;
    }
  }

  @override
  Future<void> completeSubscription() async {}

  @override
  Future<void> clearProgress() async {}

  @override
  void clearError() {}
}

class _TestBreedSelectorNotifier extends BreedSelectorNotifier {
  final BreedSelectorState _mockState;

  _TestBreedSelectorNotifier(this._mockState);

  @override
  BreedSelectorState build() => _mockState;

  @override
  Future<void> loadBreeds() async {}

  @override
  void selectBreed(DogBreed breed) {}

  @override
  void clearSelection() {}

  @override
  void clearError() {}
}
