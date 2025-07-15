part of '../home_screen.dart';

class _BreedSelector extends StatefulWidget {
  const _BreedSelector();

  @override
  State<_BreedSelector> createState() => _BreedSelectorState();
}

class _BreedSelectorState extends State<_BreedSelector> {
  String? selectedBreed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBreedSelector(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Shapes.gutter,
          vertical: Shapes.gutter,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedBreed ?? context.l10n.whatBreedIsYourDog,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }

  void _showBreedSelector(BuildContext context) {
    final breeds = [
      context.l10n.goldenRetriever,
      context.l10n.labrador,
      context.l10n.germanShepherd,
      context.l10n.frenchBulldog,
      context.l10n.borderCollie,
      context.l10n.siberianHusky,
      context.l10n.chihuahua,
      context.l10n.yorkshireTerrier,
      context.l10n.boxer,
      context.l10n.mixedBreed,
      context.l10n.other,
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Shapes.borderRadiusLarge),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(Shapes.gutter),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: Shapes.gutter),
              Text(
                context.l10n.selectBreed,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Shapes.gutter),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: breeds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        breeds[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onTap: () {
                        setState(() {
                          selectedBreed = breeds[index];
                        });
                        debugPrint('Raza seleccionada: ${breeds[index]}');
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: Shapes.gutter),
            ],
          ),
        );
      },
    );
  }
}