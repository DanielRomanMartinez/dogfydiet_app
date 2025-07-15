part of '../profile_screen.dart';

class _OrdersSummary extends ConsumerWidget {
  const _OrdersSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileScreenNotifierProvider);

    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            icon: Icons.shopping_cart,
            title: context.l10n.totalOrders,
            value: profileState.totalOrdersCount.toString(),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: Shapes.gutter),
        Expanded(
          child: _SummaryCard(
            icon: Icons.euro,
            title: context.l10n.totalValue,
            value: '€${profileState.totalOrdersValue.toStringAsFixed(2)}',
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}