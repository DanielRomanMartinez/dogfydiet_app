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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  emoji,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 13,
                              height: 1.1,
                            ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 11,
                              height: 1.1,
                            ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
