part of '../pay_subscription_screen.dart';

class _OrderSummary extends StatelessWidget {
  final String petName;

  const _OrderSummary({
    required this.petName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.needsDaily(petName, '200 g'),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: Shapes.gutter),
          Container(
            padding: const EdgeInsets.all(Shapes.gutter),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
            child: Column(
              children: [
                Text(
                  context.l10n.trial14Days,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: Shapes.gutterSmall),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Shapes.gutterSmall,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        context.l10n.discountLabel(30),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '26,20 €',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(width: Shapes.gutterSmall),
                    Text(
                      '13,10 €',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: Shapes.gutterSmall),
                Text(
                  context.l10n.trialPeriodPrice('10,48'),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                context.l10n.promoCodeQuestion,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          const Divider(),
          const SizedBox(height: Shapes.gutter),
          Text(
            context.l10n.orderContents,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: Shapes.gutter),
          OrderItem(
            title: context.l10n.chickenMenu,
            subtitle: 'x4',
            image: '🍗',
          ),
          OrderItem(
            title: context.l10n.turkeyMenu,
            subtitle: 'x4',
            image: '🦃',
          ),
          OrderItem(
            title: context.l10n.salmonMenu,
            subtitle: 'x3',
            image: '🐟',
          ),
          OrderItem(
            title: context.l10n.beefMenu,
            subtitle: 'x3',
            image: '🥩',
          ),
          OrderItem(
            title: context.l10n.welcomePack,
            subtitle: context.l10n.free,
            image: '🎁',
            isGift: true,
          ),
          const SizedBox(height: Shapes.gutter),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Text(
                context.l10n.freeShipping,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Text(
                context.l10n.securePayment,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Text(
                context.l10n.flexibility,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
