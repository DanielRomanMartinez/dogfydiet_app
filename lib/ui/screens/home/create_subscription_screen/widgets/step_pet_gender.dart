part of '../create_subscription_screen.dart';

class _StepPetGender extends ConsumerWidget {
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
              '🤔',
              style: TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: Shapes.gutter2x),
          Text(
            context.l10n.wantToKnowPet(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          Row(
            children: [
              Expanded(
                child: _GenderButton(
                  label: context.l10n.male,
                  isSelected: state.form.petGender == 'male',
                  onTap: () => notifier.updatePetGender('male'),
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: _GenderButton(
                  label: context.l10n.female,
                  isSelected: state.form.petGender == 'female',
                  onTap: () => notifier.updatePetGender('female'),
                ),
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutter2x),
          Text(
            context.l10n.isNeutered,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter),
          Row(
            children: [
              Expanded(
                child: _GenderButton(
                  label: context.l10n.yes,
                  isSelected: state.form.petNeutered == true,
                  onTap: () => notifier.updatePetNeutered(true),
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: _GenderButton(
                  label: context.l10n.no,
                  isSelected: state.form.petNeutered == false,
                  onTap: () => notifier.updatePetNeutered(false),
                ),
              ),
            ],
          ),
          if (state.form.showPregnantOrLactatingOption) ...[
            const SizedBox(height: Shapes.gutter2x),
            Text(
              context.l10n.isPregnantOrLactating(state.form.petName ?? context.l10n.yourFemale),
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Shapes.gutter),
            Row(
              children: [
                Expanded(
                  child: _GenderButton(
                    label: context.l10n.yes,
                    isSelected: state.form.petPregnantOrLactating == true,
                    onTap: () => notifier.updatePetPregnantOrLactating(true),
                  ),
                ),
                const SizedBox(width: Shapes.gutter),
                Expanded(
                  child: _GenderButton(
                    label: context.l10n.no,
                    isSelected: state.form.petPregnantOrLactating == false,
                    onTap: () => notifier.updatePetPregnantOrLactating(false),
                  ),
                ),
              ],
            ),
          ],
          const Spacer(flex: 2),
          if (state.form.petNeutered != null)
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
          if (state.form.petNeutered != null) const SizedBox(height: Shapes.gutterSmall),
          if (state.form.petNeutered != null)
            Text(
              context.l10n.afterNeuteringAdjustments,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Shapes.gutter),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isSelected ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}