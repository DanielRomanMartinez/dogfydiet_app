part of '../create_subscription_screen.dart';

class _StepAdultWeightSilhouette extends ConsumerStatefulWidget {
  @override
  ConsumerState<_StepAdultWeightSilhouette> createState() => _StepAdultWeightSilhouetteState();
}

class _StepAdultWeightSilhouetteState extends ConsumerState<_StepAdultWeightSilhouette> {
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController();
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    if (_weightController.text != (state.form.petWeight?.toString() ?? '')) {
      _weightController.text = state.form.petWeight?.toString() ?? '';
    }

    return Padding(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Text(
            context.l10n.silhouetteQuestion(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Text(
            context.l10n.selectSimilarFigure,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),

          _SilhouetteSelector(
            selectedSilhouette: state.form.petSilhouette,
            onSilhouetteSelected: notifier.updatePetSilhouette,
          ),

          const SizedBox(height: Shapes.gutter2x),

          if (state.form.petSilhouette != null) ...[
            Container(
              padding: const EdgeInsets.all(Shapes.gutter),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
              ),
              child: Column(
                children: [
                  Text(
                    _getSilhouetteDescription(context, state.form.petSilhouette!),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Shapes.gutter),
                  Text(
                    context.l10n.weightDescription(state.form.petName ?? context.l10n.yourDog),
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Shapes.gutter),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Shapes.borderRadius),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: Shapes.gutter),
                          ),
                          onChanged: (value) {
                            final weight = double.tryParse(value);
                            if (weight != null) {
                              notifier.updatePetWeight(weight);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: Shapes.gutterSmall),
                      Text(
                        context.l10n.kg,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          const Spacer(flex: 2),
        ],
      ),
    );
  }

  String _getSilhouetteDescription(BuildContext context, String silhouette) {
    switch (silhouette) {
      case 'thin':
        return context.l10n.thinSilhouetteDescription;
      case 'normal':
        return context.l10n.normalSilhouetteDescription;
      case 'overweight':
        return context.l10n.overweightSilhouetteDescription;
      default:
        return '';
    }
  }
}

class _SilhouetteSelector extends StatelessWidget {
  final String? selectedSilhouette;
  final Function(String) onSilhouetteSelected;

  const _SilhouetteSelector({
    required this.selectedSilhouette,
    required this.onSilhouetteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Shapes.gutter),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SilhouetteDog(
                    dogType: 'thin',
                    isActive: selectedSilhouette == 'thin',
                    onTap: () => onSilhouetteSelected('thin'),
                  ),
                  _SilhouetteDog(
                    dogType: 'normal',
                    isActive: selectedSilhouette == 'normal',
                    onTap: () => onSilhouetteSelected('normal'),
                  ),
                  _SilhouetteDog(
                    dogType: 'overweight',
                    isActive: selectedSilhouette == 'overweight',
                    onTap: () => onSilhouetteSelected('overweight'),
                  ),
                ],
              ),
              const SizedBox(height: Shapes.gutter),
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                          selectedSilhouette == 'thin' ? Theme.of(context).colorScheme.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedSilhouette == 'normal'
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedSilhouette == 'overweight'
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedSilhouette != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (selectedSilhouette == 'thin')
                      Expanded(child: _buildIndicator(true))
                    else
                      Expanded(child: _buildIndicator(false)),
                    if (selectedSilhouette == 'normal')
                      Expanded(child: _buildIndicator(true))
                    else
                      Expanded(child: _buildIndicator(false)),
                    if (selectedSilhouette == 'overweight')
                      Expanded(child: _buildIndicator(true))
                    else
                      Expanded(child: _buildIndicator(false)),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Center(
      child: Container(
        width: isActive ? 12 : 4,
        height: isActive ? 12 : 4,
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.transparent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SilhouetteDog extends StatelessWidget {
  final String dogType;
  final bool isActive;
  final VoidCallback onTap;

  const _SilhouetteDog({
    required this.dogType,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Shapes.gutterSmall),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: isActive ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(Shapes.borderRadius),
              ),
              child: Center(
                child: _buildDogSilhouette(dogType, isActive),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDogSilhouette(String type, bool isActive) {
    // TODO: Replace to do it with SVG
    String emoji;
    Color color;

    switch (type) {
      case 'thin':
        emoji = '🐕';
        color = Colors.grey[600]!;
        break;
      case 'normal':
        emoji = '🐕';
        color = Colors.brown[600]!;
        break;
      case 'overweight':
        emoji = '🐕';
        color = Colors.brown[400]!;
        break;
      default:
        emoji = '🐕';
        color = Colors.grey[600]!;
    }

    return Text(
      emoji,
      style: TextStyle(
        fontSize: isActive ? 32 : 24,
        color: color,
      ),
    );
  }
}