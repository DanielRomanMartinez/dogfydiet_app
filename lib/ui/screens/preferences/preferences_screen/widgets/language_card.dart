part of '../preferences_screen.dart';

class _LanguageCard extends ConsumerWidget {
  const _LanguageCard();

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final preferencesState = ref.watch(preferencesNotifierProvider);
    final preferencesNotifier = ref.read(preferencesNotifierProvider.notifier);


    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => _LanguageBottomSheet.show(context),
        borderRadius: Shapes.cardBorderRadius,
        child: Padding(
          padding: const EdgeInsets.all(Shapes.gutter),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Shapes.gutterSmall),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(Shapes.borderRadius),
                ),
                child: Icon(
                  Icons.language,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.appLanguage,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          preferencesNotifier.getLanguageFlag(preferencesState.currentLocale.languageCode),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          preferencesNotifier.getLanguageName(preferencesState.currentLocale.languageCode),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
