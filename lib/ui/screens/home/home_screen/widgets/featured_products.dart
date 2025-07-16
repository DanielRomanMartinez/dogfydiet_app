part of '../home_screen.dart';

class _FeaturedProducts extends StatelessWidget {
  const _FeaturedProducts();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Shapes.gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  context.l10n.featuredProducts,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                onPressed: () {
                  debugPrint('Ver todos los productos');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8), // Reducir padding
                ),
                child: Text(
                  context.l10n.viewAll,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutter),
          SizedBox(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 190,
                  child: _FeaturedProductCard(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}