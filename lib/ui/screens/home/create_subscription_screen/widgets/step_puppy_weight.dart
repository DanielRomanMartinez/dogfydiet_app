part of '../create_subscription_screen.dart';

class _StepPuppyWeight extends ConsumerStatefulWidget {
  @override
  ConsumerState<_StepPuppyWeight> createState() => _StepPuppyWeightState();
}

class _StepPuppyWeightState extends ConsumerState<_StepPuppyWeight> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    if (_controller.text != (state.form.petWeight?.toString() ?? '')) {
      _controller.text = state.form.petWeight?.toString() ?? '';
    }

    return Padding(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: Shapes.gutter),
                    Container(
                      padding: const EdgeInsets.all(Shapes.gutter),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '🍼',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    const SizedBox(height: Shapes.gutter),
                    Text(
                      context.l10n.puppyExclamation(state.form.petName ?? context.l10n.yourDog),
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Shapes.gutterSmall),
                    Text(
                      context.l10n.importantKnowCurrentWeight,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Shapes.gutter),
                    Text(
                      context.l10n.weightDescription(state.form.petName ?? context.l10n.yourDog),
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Shapes.gutter),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: TextField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(Shapes.borderRadius),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: Shapes.gutter),
                            ),
                            onChanged: (value) {
                              final weight = double.tryParse(value);
                              if (weight != null) {
                                notifier.updatePetWeight(weight);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: Shapes.gutterSmall),
                        Text(
                          context.l10n.kg,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.all(Shapes.gutter),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
                      ),
                      child: Row(
                        children: [
                          Text(
                            context.l10n.whyImportant,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.info_outline,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Shapes.gutterSmall),
                    Text(
                      context.l10n.knowPuppyWeightFundamental,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Shapes.gutter),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}