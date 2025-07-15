part of '../profile_screen.dart';

class _OrderStatusChip extends StatelessWidget {
  final OrderStatus status;

  const _OrderStatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Shapes.gutterSmall,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: OrderStatusLocalizer.getStatusBackgroundColor(context, status),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        OrderStatusLocalizer.getDisplayName(context, status),
        style: TextStyle(
          color: OrderStatusLocalizer.getStatusColor(context, status),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
