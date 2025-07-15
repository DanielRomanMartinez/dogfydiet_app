part of '../create_subscription_screen.dart';

class _StepPetName extends ConsumerStatefulWidget {
  @override
  ConsumerState<_StepPetName> createState() => _StepPetNameState();
}

class _StepPetNameState extends ConsumerState<_StepPetName> {
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

    final currentText = state.form.petName ?? '';
    if (_controller.text != currentText) {
      _controller.text = currentText;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }

    final breedName = state.form.selectedBreed?.getLocalizedName('es').toLowerCase() ?? context.l10n.dog;

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
            context.l10n.petNameQuestion(breedName),
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
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: context.l10n.myDogIsCalled,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Shapes.gutter,
                      vertical: Shapes.gutter,
                    ),
                  ),
                  onChanged: (value) {
                    notifier.updatePetName(value);
                  },
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          Text(
            context.l10n.excitementImproveLife(breedName),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}