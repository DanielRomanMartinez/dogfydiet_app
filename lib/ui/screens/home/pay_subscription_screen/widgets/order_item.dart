part of '../pay_subscription_screen.dart';

class OrderItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool isGift;

  const OrderItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isGift = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Shapes.gutterSmall),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                image,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: Shapes.gutter),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Shapes.gutterSmall,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: isGift
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isGift
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}