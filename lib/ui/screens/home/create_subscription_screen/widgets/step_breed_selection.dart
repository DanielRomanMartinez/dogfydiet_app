part of '../create_subscription_screen.dart';

class _StepBreedSelection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Container(
            padding: const EdgeInsets.all(Shapes.gutter),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Text(
              '✏️',
              style: TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: Shapes.gutter2x),
          Text(
            context.l10n.breedQuestion,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Shapes.gutterSmall),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '🐕',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: BreedSelector(
                  selectedBreed: state.form.selectedBreed,
                  onBreedSelected: notifier.updateBreed,
                  placeholder: context.l10n.searchBreedPlaceholder,
                ),
              ),
            ],
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}