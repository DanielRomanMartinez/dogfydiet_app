import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/common/utilities/exit_confirmation_dialog.dart';
import 'package:dogfydiet_app/ui/common/widgets/breed_selector.dart';
import 'package:dogfydiet_app/ui/screens/home/summary_subscription_screen/summary_subscription_screen.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/progress_bar.dart';
part 'widgets/step_breed_selection.dart';
part 'widgets/step_pet_name.dart';
part 'widgets/step_pet_gender.dart';
part 'widgets/step_birth_date.dart';
part 'widgets/step_adult_weight_silhouette.dart';
part 'widgets/step_puppy_weight.dart';
part 'widgets/step_activity_level.dart';
part 'widgets/step_health_conditions.dart';
part 'widgets/step_food_preferences.dart';
part 'widgets/step_owner_details.dart';

class CreateSubscriptionScreen extends ConsumerStatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'create-subscription';

  const CreateSubscriptionScreen({super.key});

  @override
  ConsumerState<CreateSubscriptionScreen> createState() => _CreateSubscriptionScreenState();
}

class _CreateSubscriptionScreenState extends ConsumerState<CreateSubscriptionScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);
      final initialPageIndex = notifier.currentPageIndex;
      if (initialPageIndex > 0) {
        _pageController.jumpToPage(initialPageIndex);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    final state = ref.read(createSubscriptionScreenNotifierProvider);

    if (state.form.currentStep == state.form.enabledSteps.first) {
      return await ExitConfirmationDialog.show(context, ref) ?? false;
    } else {
      ref.read(createSubscriptionScreenNotifierProvider.notifier).previousStep();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);

    ref.listen(createSubscriptionScreenNotifierProvider, (previous, next) {
      if (previous?.form.currentStep != next.form.currentStep) {
        final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);
        final newPageIndex = notifier.currentPageIndex;
        _pageController.animateToPage(
          newPageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }

      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        ref.read(createSubscriptionScreenNotifierProvider.notifier).clearError();
      }
    });

    if (state.isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldPop = await _onWillPop();
          if (shouldPop && context.mounted) {
            context.pop();
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _ProgressBar(
                progress: state.form.progress,
                currentStep: state.form.currentStepIndex + 1,
                totalSteps: state.form.totalSteps,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _StepBreedSelection(),
                    _StepPetName(),
                    _StepPetGender(),
                    _StepBirthDate(),
                    _StepAdultWeightSilhouette(),
                    _StepPuppyWeight(),
                    _StepActivityLevel(),
                    _StepHealthConditions(),
                    _StepFoodPreferences(),
                    _StepOwnerDetails(),
                  ],
                ),
              ),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    final isLastStep = state.form.currentStepIndex == state.form.totalSteps - 1;
    final canProceed = state.form.isCurrentStepValid();

    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: Row(
        children: [
          if (notifier.canGoPrevious())
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  notifier.previousStep();
                },
                child: Text(context.l10n.back),
              ),
            ),
          if (notifier.canGoPrevious()) const SizedBox(width: Shapes.gutter),
          Expanded(
            flex: notifier.canGoPrevious() ? 1 : 2,
            child: ElevatedButton(
              onPressed: canProceed
                  ? () {
                      if (isLastStep) {
                        context.go(SummarySubscriptionScreen.routePath);
                      } else {
                        notifier.nextStep();
                      }
                    }
                  : null,
              child: Text(context.l10n.continueButton),
            ),
          ),
        ],
      ),
    );
  }
}
