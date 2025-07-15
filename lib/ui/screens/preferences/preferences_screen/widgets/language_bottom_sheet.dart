part of '../preferences_screen.dart';

class _LanguageBottomSheet extends ConsumerWidget {
  const _LanguageBottomSheet();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _LanguageBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesState = ref.watch(preferencesNotifierProvider);
    final preferencesNotifier = ref.read(preferencesNotifierProvider.notifier);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Shapes.borderRadiusXLarge),
          topRight: Radius.circular(Shapes.borderRadiusXLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Shapes.gutter),
            child: Row(
              children: [
                Text(
                  context.l10n.selectLanguage,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: preferencesNotifier.supportedLanguages.length,
              itemBuilder: (context, index) {
                final language = preferencesNotifier.supportedLanguages[index];
                final isSelected = language.code == preferencesState.currentLocale.languageCode;

                return ListTile(
                  leading: Text(
                    language.flag,
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: Text(
                    language.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isSelected ? Theme.of(context).colorScheme.primary : null,
                          fontWeight: isSelected ? FontWeight.w600 : null,
                        ),
                  ),
                  trailing: isSelected
                      ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                  onTap: () {
                    preferencesNotifier.changeLanguage(language.code);
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
  }
}
