part of '../profile_screen.dart';

class _EmptyOrders extends ConsumerWidget {
  const _EmptyOrders();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileScreenNotifierProvider);
    final hasFilter = profileState.selectedStatusFilter != null;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Shapes.gutter2x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(Shapes.gutter2x),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  hasFilter ? Icons.search_off : Icons.shopping_cart_outlined,
                  size: 64,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: Shapes.gutter2x),
              Text(
                hasFilter
                    ? context.l10n.noOrdersWithStatus
                    : context.l10n.noOrdersYet,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Shapes.gutter),
              Text(
                hasFilter
                    ? context.l10n.tryDifferentFilter
                    : context.l10n.firstOrderMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Shapes.gutter2x),
              if (hasFilter)
                OutlinedButton.icon(
                  onPressed: () {
                    ref.read(profileScreenNotifierProvider.notifier).clearStatusFilter();
                  },
                  icon: const Icon(Icons.clear),
                  label: Text(context.l10n.clearFilter),
                )
              else
                ElevatedButton.icon(
                  onPressed: () {
                    context.go(HomeScreen.routePath);
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(context.l10n.goToShop),
                ),
            ],
          ),
        ),
      ),
    );
  }
}