part of '../home_screen.dart';

class _ProductCategory extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emoji;
  final Color color;
  final VoidCallback onTap;

  const _ProductCategory({
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Shapes.cardElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: Shapes.cardBorderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: Shapes.cardBorderRadius,
        child: Padding(
          padding: const EdgeInsets.all(Shapes.gutterSmall),
          child: Column(
            children: [
              Text(
                emoji,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}