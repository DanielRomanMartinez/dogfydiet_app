part of '../profile_screen.dart';

class _OrderStatusFilter extends ConsumerWidget {
  const _OrderStatusFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileScreenNotifierProvider);
    final profileNotifier = ref.read(profileScreenNotifierProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.filter_list,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: Shapes.gutterSmall),
            Text(
              context.l10n.filterByStatus,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: Shapes.gutter),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Shapes.gutterSmall),
                child: FilterChip(
                  label: Text(
                    context.l10n.all,
                    style: TextStyle(
                      color: profileState.selectedStatusFilter == null
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: profileState.selectedStatusFilter == null
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  selected: profileState.selectedStatusFilter == null,
                  onSelected: (selected) {
                    profileNotifier.clearStatusFilter();
                  },
                  selectedColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  checkmarkColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  side: BorderSide(
                    color: profileState.selectedStatusFilter == null
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              ...OrderStatus.values.map((status) {
                final count = profileState.orders.where((order) => order.status == status).length;
                final isSelected = profileState.selectedStatusFilter == status;

                return Padding(
                  padding: const EdgeInsets.only(right: Shapes.gutterSmall),
                  child: FilterChip(
                    label: Text(
                      '${OrderStatusLocalizer.getDisplayName(context, status)} ($count)',
                      style: TextStyle(
                        color: isSelected
                            ? OrderStatusLocalizer.getStatusColor(context, status)
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        profileNotifier.filterByStatus(status);
                      } else {
                        profileNotifier.clearStatusFilter();
                      }
                    },
                    selectedColor: OrderStatusLocalizer.getStatusBackgroundColor(context, status),
                    checkmarkColor: OrderStatusLocalizer.getStatusColor(context, status),
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    side: BorderSide(
                      color: isSelected
                          ? OrderStatusLocalizer.getStatusColor(context, status)
                          : Theme.of(context).colorScheme.outline,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}