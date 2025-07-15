part of '../home_screen.dart';

class _Benefits extends StatelessWidget {
  const _Benefits();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Shapes.gutter),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _BenefitCard(
                  emoji: '🏃‍♀️',
                  percentage: '87,4%',
                  description: context.l10n.improveDigestion,
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: _BenefitCard(
                  emoji: '✨',
                  percentage: '74%',
                  description: context.l10n.shinierCoat,
                ),
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutter),
          Row(
            children: [
              Expanded(
                child: _BenefitCard(
                  emoji: '❤️',
                  percentage: '92%',
                  description: context.l10n.moreEnergyVitality,
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: _BenefitCard(
                  emoji: '🥗',
                  percentage: '100%',
                  description: context.l10n.naturalIngredients,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}