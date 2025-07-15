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
              Text(
                context.l10n.featuredProducts,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  debugPrint('Ver todos los productos');
                },
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 210,
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