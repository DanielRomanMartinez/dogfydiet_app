part of '../home_screen.dart';

class _CreateSubscription extends StatelessWidget {
  const _CreateSubscription();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Shapes.gutter),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: Shapes.cardBorderRadius,
      ),
      child: Container(
        padding: const EdgeInsets.all(Shapes.gutter2x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.putRealFoodInBowl,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                height: 1.2,
              ),
            ),
            const SizedBox(height: Shapes.gutter),
            Text(
              context.l10n.naturalFoodDescription,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: Shapes.gutter2x),
            const _BreedSelector(),
            const SizedBox(height: Shapes.gutter),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Navegar a crear menú/suscripción');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    vertical: Shapes.gutter,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.createMenu,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: Shapes.gutterSmall),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}