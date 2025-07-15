part of '../profile_screen.dart';

class _OrderDetailsSheet extends StatelessWidget {
  final Order order;

  const _OrderDetailsSheet({required this.order});

  static void show(BuildContext context, Order order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _OrderDetailsSheet(order: order),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Shapes.borderRadiusXLarge),
              topRight: Radius.circular(Shapes.borderRadiusXLarge),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(Shapes.gutter),
                child: Row(
                  children: [
                    Text(
                      context.l10n.orderDetails,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: Shapes.gutter),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(Shapes.gutter),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Pedido #${order.id}',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  _OrderStatusChip(status: order.status),
                                ],
                              ),
                              const SizedBox(height: Shapes.gutter),
                              _InfoRow(
                                icon: Icons.person,
                                title: context.l10n.customer,
                                value: order.customerName,
                              ),
                              const SizedBox(height: Shapes.gutterSmall),
                              _InfoRow(
                                icon: Icons.email,
                                title: context.l10n.email,
                                value: order.customerEmail,
                              ),
                              const SizedBox(height: Shapes.gutterSmall),
                              _InfoRow(
                                icon: Icons.schedule,
                                title: context.l10n.date,
                                value: DateFormat('dd/MM/yyyy HH:mm').format(order.orderDate),
                              ),
                              if (order.notes != null && order.notes!.isNotEmpty) ...[
                                const SizedBox(height: Shapes.gutterSmall),
                                _InfoRow(
                                  icon: Icons.note,
                                  title: context.l10n.notes,
                                  value: order.notes!,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: Shapes.gutter),

                      Text(
                        context.l10n.itemsCount(order.items.length),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: Shapes.gutter),

                      ...order.items.map(
                            (item) => Padding(
                          padding: const EdgeInsets.only(bottom: Shapes.gutter),
                          child: _OrderItemCard(item: item),
                        ),
                      ),

                      const SizedBox(height: Shapes.gutter),

                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(Shapes.gutter),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '€${order.calculatedTotal.toStringAsFixed(2)}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: Shapes.gutterSmall),
                              const Divider(),
                              const SizedBox(height: Shapes.gutterSmall),
                              Row(
                                children: [
                                  Text(
                                    'Total',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '€${order.totalAmount.toStringAsFixed(2)}',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: Shapes.gutter4x),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}