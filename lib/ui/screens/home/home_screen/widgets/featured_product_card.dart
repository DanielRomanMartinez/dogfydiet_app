part of '../home_screen.dart';

class _FeaturedProductCard extends StatelessWidget {
  final int index;

  const _FeaturedProductCard(
      this.index,
      );

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': context.l10n.premiumChickenMenu,
        'description': context.l10n.richInProteins,
        'price': '42,99€',
        'originalPrice': '49,99€',
        'emoji': '🍗',
      },
      {
        'name': context.l10n.premiumSalmonMenu,
        'description': context.l10n.withOmega3,
        'price': '45,99€',
        'originalPrice': '52,99€',
        'emoji': '🐟',
      },
      {
        'name': context.l10n.premiumBeefMenu,
        'description': context.l10n.withMediterranean,
        'price': '44,99€',
        'originalPrice': '51,99€',
        'emoji': '🥩',
      },
    ];

    final product = products[index];

    return Card(
      elevation: Shapes.cardElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: Shapes.cardBorderRadius,
      ),
      child: InkWell(
        onTap: () {
          debugPrint('Tap en producto: ${product['name']}');
        },
        borderRadius: Shapes.cardBorderRadius,
        child: Container(
          padding: const EdgeInsets.all(Shapes.gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Shapes.borderRadiusSmall),
                  ),
                ),
                child: Center(
                  child: Text(
                    product['emoji']!,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
              const SizedBox(height: Shapes.gutter),
              Text(
                product['name']!,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                product['description']!,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        product['price']!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        product['originalPrice']!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}