import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_subscription_screen_notifier.g.dart';

@riverpod
class CreateSubscriptionScreenNotifier extends _$CreateSubscriptionScreenNotifier {
  @override
  CreateSubscriptionScreenState build() {
    const initialState = CreateSubscriptionScreenState(
      form: SubscriptionForm(),
      isLoading: false,
      error: null,
      isSubmitting: false,
    );

    Future.microtask(() => loadProgress());
    return initialState;
  }

  Future<void> loadProgress() async {
    state = state.copyWith(isLoading: true);

    try {
      final subscriptionService = ref.read(subscriptionServiceProvider);
      final savedForm = await subscriptionService.getProgress();

      if (savedForm != null) {
        final validatedForm = _validateCurrentStep(savedForm);
        state = state.copyWith(
          form: validatedForm,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          form: const SubscriptionForm(),
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        form: const SubscriptionForm(),
        isLoading: false,
        error: 'Error loading progress: $e',
      );
    }
  }

  SubscriptionForm _validateCurrentStep(SubscriptionForm form) {
    if (!form.isCurrentStepEnabled) {
      final enabledSteps = form.enabledSteps;
      final currentIndex = form.currentStepIndex;

      if (currentIndex >= 0 && currentIndex < enabledSteps.length) {
        return form.copyWith(currentStep: enabledSteps[currentIndex]);
      } else {
        return form.copyWith(currentStep: enabledSteps.first);
      }
    }
    return form;
  }

  Future<void> saveProgress() async {
    try {
      final subscriptionService = ref.read(subscriptionServiceProvider);
      await subscriptionService.saveProgress(state.form);
    } catch (e) {
      state = state.copyWith(error: 'Error saving progress: $e');
    }
  }

  void updateBreed(DogBreed breed) {
    state = state.copyWith(
      form: state.form.copyWith(selectedBreed: breed),
    );
    saveProgress();
  }

  void updatePetName(String name) {
    state = state.copyWith(
      form: state.form.copyWith(petName: name.trim().isNotEmpty ? name.trim() : null),
    );
    saveProgress();
  }

  void updatePetGender(String gender) {
    state = state.copyWith(
      form: state.form.copyWith(petGender: gender),
    );
    saveProgress();
  }

  void updatePetNeutered(bool neutered) {
    state = state.copyWith(
      form: state.form.copyWith(petNeutered: neutered),
    );
    saveProgress();
  }

  void updatePetPregnantOrLactating(bool? pregnantOrLactating) {
    state = state.copyWith(
      form: state.form.copyWith(petPregnantOrLactating: pregnantOrLactating),
    );
    saveProgress();
  }

  void updatePetBirthDate(DateTime birthDate) {
    final currentForm = state.form;
    final updatedForm = currentForm.copyWith(petBirthDate: birthDate);

    final wasOnAdultWeightStep = currentForm.currentStep == SubscriptionForm.stepAdultWeightSilhouette;
    final wasOnPuppyWeightStep = currentForm.currentStep == SubscriptionForm.stepPuppyWeight;

    SubscriptionForm finalForm = updatedForm;

    if (wasOnAdultWeightStep && updatedForm.isPuppy) {
      finalForm = updatedForm.copyWith(currentStep: SubscriptionForm.stepPuppyWeight);
    } else if (wasOnPuppyWeightStep && !updatedForm.isPuppy) {
      finalForm = updatedForm.copyWith(currentStep: SubscriptionForm.stepAdultWeightSilhouette);
    }

    state = state.copyWith(form: finalForm);
    saveProgress();
  }

  void updatePetSilhouette(String silhouette) {
    state = state.copyWith(
      form: state.form.copyWith(petSilhouette: silhouette),
    );
    saveProgress();
  }

  void updatePetWeight(double weight) {
    state = state.copyWith(
      form: state.form.copyWith(petWeight: weight),
    );
    saveProgress();
  }

  void updateActivityLevel(String activityLevel) {
    state = state.copyWith(
      form: state.form.copyWith(activityLevel: activityLevel),
    );
    saveProgress();
  }

  void updateHealthConditions(List<String> conditions) {
    state = state.copyWith(
      form: state.form.copyWith(healthConditions: conditions),
    );
    saveProgress();
  }

  void updateFoodPreferences(String preferences) {
    state = state.copyWith(
      form: state.form.copyWith(foodPreferences: preferences),
    );
    saveProgress();
  }

  void updateOwnerEmail(String email) {
    state = state.copyWith(
      form: state.form.copyWith(ownerEmail: email),
    );
    saveProgress();
  }

  void updateOwnerPhone(String phone) {
    state = state.copyWith(
      form: state.form.copyWith(ownerPhone: phone),
    );
    saveProgress();
  }

  void nextStep() {
    final nextStep = state.form.nextStepIndex;
    if (nextStep != null) {
      state = state.copyWith(
        form: state.form.copyWith(currentStep: nextStep),
      );
      saveProgress();
    }
  }

  void previousStep() {
    final prevStep = state.form.previousStepIndex;
    if (prevStep != null) {
      state = state.copyWith(
        form: state.form.copyWith(currentStep: prevStep),
      );
      saveProgress();
    }
  }

  void goToStep(int step) {
    if (state.form.enabledSteps.contains(step)) {
      state = state.copyWith(
        form: state.form.copyWith(currentStep: step),
      );
      saveProgress();
    }
  }

  bool canGoNext() {
    return state.form.isCurrentStepValid() && state.form.nextStepIndex != null;
  }

  bool canGoPrevious() {
    return state.form.previousStepIndex != null;
  }

  int get currentPageIndex {
    final currentStep = state.form.currentStep;

    switch (currentStep) {
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

  Future<void> completeSubscription() async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final subscriptionService = ref.read(subscriptionServiceProvider);
      final completedForm = state.form.copyWith(isCompleted: true);

      await subscriptionService.submitForm(completedForm);

      await subscriptionService.clearProgress();

      state = state.copyWith(
        form: const SubscriptionForm(),
        isSubmitting: false,
      );
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Error completing subscription: $e',
      );
    }
  }

  Future<void> clearProgress() async {
    try {
      final subscriptionService = ref.read(subscriptionServiceProvider);
      await subscriptionService.clearProgress();
      state = state.copyWith(
        form: const SubscriptionForm(),
      );
    } catch (e) {
      state = state.copyWith(error: 'Error clearing progress: $e');
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class CreateSubscriptionScreenState extends Equatable {
  final SubscriptionForm form;
  final bool isLoading;
  final String? error;
  final bool isSubmitting;

  const CreateSubscriptionScreenState({
    required this.form,
    required this.isLoading,
    this.error,
    required this.isSubmitting,
  });

  CreateSubscriptionScreenState copyWith({
    SubscriptionForm? form,
    bool? isLoading,
    String? error,
    bool? isSubmitting,
  }) {
    return CreateSubscriptionScreenState(
      form: form ?? this.form,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [
        form,
        isLoading,
        error,
        isSubmitting,
      ];
}
