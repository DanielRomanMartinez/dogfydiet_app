part of '../create_subscription_screen.dart';

class _StepHealthConditions extends ConsumerWidget {
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
              '❤️',
              style: TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: Shapes.gutter2x),
          Text(
            context.l10n.healthConditionsQuestion(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          Row(
            children: [
              Expanded(
                child: _GenderButton(
                  label: context.l10n.yes,
                  isSelected: (state.form.healthConditions?.isNotEmpty ?? false),
                  onTap: () {
                    _showHealthConditionsSelector(context, ref);
                  },
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: _GenderButton(
                  label: context.l10n.no,
                  isSelected: state.form.healthConditions?.isEmpty ?? true,
                  onTap: () => notifier.updateHealthConditions([]),
                ),
              ),
            ],
          ),
          if (state.form.healthConditions?.isNotEmpty ?? false) ...[
            const SizedBox(height: Shapes.gutter),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Shapes.gutter),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(Shapes.borderRadius),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.selectedPathologies,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: Shapes.gutterSmall),
                  Text(
                    state.form.healthConditions!.join(', '),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
          const Spacer(flex: 2),
          Container(
            padding: const EdgeInsets.all(Shapes.gutter),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
            ),
            child: Column(
              children: [
                Text(
                  context.l10n.everyDogIsAWorld,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Shapes.gutterSmall),
                Text(
                  context.l10n.dontWorryAdaptMenu,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  void _showHealthConditionsSelector(BuildContext context, WidgetRef ref) {
    final conditions = [
      context.l10n.allergiesIntolerances,
      context.l10n.sensitiveDigestion,
      context.l10n.skinProblems,
      context.l10n.jointProblems,
      context.l10n.dentalProblems,
      context.l10n.diabetes,
      context.l10n.kidneyProblems,
      context.l10n.heartProblems,
      context.l10n.overweight,
      context.l10n.underweight,
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Shapes.borderRadiusLarge),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(Shapes.gutter),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outline,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: Shapes.gutter),
                  Text(
                    context.l10n.selectPathology,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: Shapes.gutter),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: conditions.length,
                      itemBuilder: (context, index) {
                        final condition = conditions[index];

                        return ListTile(
                          title: Text(
                            condition,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onTap: () {
                            ref.read(createSubscriptionScreenNotifierProvider.notifier)
                                .updateHealthConditions([condition]);
                            context.pop();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}