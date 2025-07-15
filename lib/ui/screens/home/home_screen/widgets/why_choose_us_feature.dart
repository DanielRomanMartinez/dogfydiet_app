part of '../home_screen.dart';

class _WhyChooseUsFeature extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _WhyChooseUsFeature({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Shapes.gutterSmall),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(Shapes.borderRadiusSmall),
            ),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: Shapes.iconSizeLarge,
          ),
        ),
        const SizedBox(width: Shapes.gutter),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}