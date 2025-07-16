part of '../home_screen.dart';

class _CreateSubscription extends ConsumerWidget {
  const _CreateSubscription();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBreed = ref.watch(homeScreenNotifierProvider);

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
            BreedSelector(
              selectedBreed: selectedBreed,
              onBreedSelected: (DogBreed breed) {
                ref.read(homeScreenNotifierProvider.notifier).selectBreed(breed);
              },
            ),
            const SizedBox(height: Shapes.gutter),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedBreed != null) {
                    _navigateWithBreed(context, ref, selectedBreed);
                  } else {
                    context.go(CreateSubscriptionScreen.routePath);
                  }
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

  void _navigateWithBreed(BuildContext context, WidgetRef ref, DogBreed breed) async {
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    notifier.updateBreed(breed);
    notifier.goToStep(1);

    context.go(CreateSubscriptionScreen.routePath);
  }
}
