part of '../home_screen.dart';

class _WhyChooseUs extends StatelessWidget {
  const _WhyChooseUs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Shapes.gutter),
      padding: const EdgeInsets.all(Shapes.gutter2x),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: Shapes.cardBorderRadius,
      ),
      child: Column(
        children: [
          Text(
            context.l10n.whyChooseDogfy,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          _WhyChooseUsFeature(
            icon: Icons.science_outlined,
            title: context.l10n.scientificSupport,
            description: context.l10n.developedByVets,
          ),
          const SizedBox(height: Shapes.gutter),
          _WhyChooseUsFeature(
            icon: Icons.local_shipping_outlined,
            title: context.l10n.homeDelivery,
            description: context.l10n.receiveFreshFood,
          ),
          const SizedBox(height: Shapes.gutter),
          _WhyChooseUsFeature(
            icon: Icons.tune_outlined,
            title: context.l10n.personalized,
            description: context.l10n.menusAdapted,
          ),
        ],
      ),
    );
  }
}