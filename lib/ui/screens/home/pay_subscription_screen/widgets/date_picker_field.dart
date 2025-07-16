part of '../pay_subscription_screen.dart';

class _DatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const _DatePickerField({
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(Shapes.borderRadius),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: Shapes.gutter),
          Expanded(
            child: Text(
              selectedDate?.toString().split(' ')[0] ?? '23-07-2025',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date != null) {
                onDateSelected(date);
              }
            },
            child: Text(
              context.l10n.edit,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}