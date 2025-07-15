part of '../create_subscription_screen.dart';

class _StepBirthDate extends ConsumerWidget {
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
              '🎂',
              style: TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: Shapes.gutter2x),
          Text(
            context.l10n.birthDateQuestion(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          _DateSelector(
            selectedDate: state.form.petBirthDate,
            onDateChanged: notifier.updatePetBirthDate,
          ),
          const Spacer(flex: 2),
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
            context.l10n.calorieNeedsVaryByAge,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

class _DateSelector extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;

  const _DateSelector({
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final years = List.generate(20, (index) => currentYear - index);
    final months = [
      context.l10n.january,
      context.l10n.february,
      context.l10n.march,
      context.l10n.april,
      context.l10n.may,
      context.l10n.june,
      context.l10n.july,
      context.l10n.august,
      context.l10n.september,
      context.l10n.october,
      context.l10n.november,
      context.l10n.december,
    ];

    return Column(
      children: [
        DropdownButtonFormField<int>(
          value: selectedDate?.year,
          decoration: InputDecoration(
            hintText: '2025',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
          items: years
              .map(
                (year) => DropdownMenuItem(
              value: year,
              child: Text(year.toString()),
            ),
          )
              .toList(),
          onChanged: (year) {
            if (year != null) {
              final month = selectedDate?.month ?? 1;
              onDateChanged(DateTime(year, month));
            }
          },
        ),
        const SizedBox(height: Shapes.gutter),
        DropdownButtonFormField<int>(
          value: selectedDate?.month,
          decoration: InputDecoration(
            hintText: context.l10n.february,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
          items: months
              .asMap()
              .entries
              .map(
                (entry) => DropdownMenuItem(
              value: entry.key + 1,
              child: Text(entry.value),
            ),
          )
              .toList(),
          onChanged: (month) {
            if (month != null) {
              final year = selectedDate?.year ?? DateTime.now().year;
              onDateChanged(DateTime(year, month));
            }
          },
        ),
      ],
    );
  }
}