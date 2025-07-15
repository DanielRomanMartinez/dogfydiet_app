part of '../create_subscription_screen.dart';

class _StepFoodPreferences extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Text(
            context.l10n.foodCriticQuestion,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Text(
            context.l10n.chooseFoodOption(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          _FoodPreferenceSelector(
            selectedPreference: state.form.foodPreferences,
            onPreferenceSelected: notifier.updateFoodPreferences,
          ),
          const Spacer(flex: 2),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class _FoodPreferenceSelector extends StatelessWidget {
  final String? selectedPreference;
  final Function(String) onPreferenceSelected;

  const _FoodPreferenceSelector({
    required this.selectedPreference,
    required this.onPreferenceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _FoodDog(
              emoji: '🤢',
              label: context.l10n.selective,
              isActive: selectedPreference == 'selective',
              onTap: () => onPreferenceSelected('selective'),
            ),
            _FoodDog(
              emoji: '🐕',
              label: context.l10n.gourmet,
              isActive: selectedPreference == 'gourmet',
              onTap: () => onPreferenceSelected('gourmet'),
            ),
            _FoodDog(
              emoji: '😋',
              label: context.l10n.eatsEverything,
              isActive: selectedPreference == 'everything',
              onTap: () => onPreferenceSelected('everything'),
            ),
          ],
        ),
        const SizedBox(height: Shapes.gutter),
        Container(
          padding: const EdgeInsets.all(Shapes.gutter),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
          ),
          child: Text(
            _getDescription(context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  String _getDescription(BuildContext context) {
    switch (selectedPreference) {
      case 'selective':
        return context.l10n.selectiveDescription;
      case 'gourmet':
        return context.l10n.gourmetDescription;
      case 'everything':
        return context.l10n.eatsEverythingDescription;
      default:
        return context.l10n.selectOptionForDescription;
    }
  }
}

class _FoodDog extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FoodDog({
    required this.emoji,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Shapes.gutter),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(Shapes.borderRadius),
        ),
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: isActive ? 48 : 32,
          ),
        ),
      ),
    );
  }
}