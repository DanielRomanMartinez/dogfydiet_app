part of '../home_screen.dart';

class _Products extends StatelessWidget {
  const _Products();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Shapes.gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.ourProducts,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: Shapes.gutter),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            children: [
              _ProductCategory(
                title: context.l10n.premiumMenus,
                subtitle: context.l10n.completeDaily,
                emoji: '🍽️',
                color: Theme.of(context).colorScheme.primary,
                onTap: () {
                  debugPrint('Tap on ${context.l10n.premiumMenus}');
                },
              ),
              _ProductCategory(
                title: context.l10n.naturalSnacks,
                subtitle: context.l10n.healthyTreats,
                emoji: '🦴',
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  debugPrint('Tap on ${context.l10n.naturalSnacks}');
                },
              ),
              _ProductCategory(
                title: context.l10n.supplements,
                subtitle: context.l10n.specificCare,
                emoji: '💊',
                color: Theme.of(context).colorScheme.tertiary,
                onTap: () {
                  debugPrint('Tap on ${context.l10n.supplements}');
                },
              ),
              _ProductCategory(
                title: context.l10n.accessories,
                subtitle: context.l10n.everythingForYourDog,
                emoji: '🎾',
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  debugPrint('Tap on ${context.l10n.accessories}');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}