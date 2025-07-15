part of '../create_subscription_screen.dart';

class _StepActivityLevel extends ConsumerWidget {
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
            context.l10n.activityLevelQuestion(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Text(
            context.l10n.chooseActivityLevel,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          _ActivityLevelSelector(
            selectedLevel: state.form.activityLevel,
            onLevelSelected: notifier.updateActivityLevel,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class _ActivityLevelSelector extends StatelessWidget {
  final String? selectedLevel;
  final Function(String) onLevelSelected;

  const _ActivityLevelSelector({
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ActivityDog(
              emoji: '😴',
              isActive: selectedLevel == 'low',
              onTap: () => onLevelSelected('low'),
            ),
            _ActivityDog(
              emoji: '🐕',
              isActive: selectedLevel == 'medium',
              onTap: () => onLevelSelected('medium'),
            ),
            _ActivityDog(
              emoji: '🏃‍♂️',
              isActive: selectedLevel == 'high',
              onTap: () => onLevelSelected('high'),
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
    switch (selectedLevel) {
      case 'low':
        return context.l10n.lowActivityDescription;
      case 'medium':
        return context.l10n.mediumActivityDescription;
      case 'high':
        return context.l10n.highActivityDescription;
      default:
        return context.l10n.selectOptionForDescription;
    }
  }
}

class _ActivityDog extends StatelessWidget {
  final String emoji;
  final bool isActive;
  final VoidCallback onTap;

  const _ActivityDog({
    required this.emoji,
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
          color: isActive ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : Colors.transparent,
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
