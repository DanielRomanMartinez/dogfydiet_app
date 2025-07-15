import 'package:dogfydiet_app/application/screens/preferences/preferences_screen/preferences_screen_notifier.dart';
import 'package:dogfydiet_app/ui/common/app_layout/app_layout.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'widgets/language_bottom_sheet.dart';
part 'widgets/language_card.dart';
part 'widgets/section_header.dart';
part 'widgets/setting_card.dart';

class PreferencesScreen extends ConsumerStatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'preferences';

  const PreferencesScreen({super.key});

  @override
  ConsumerState<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends ConsumerState<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    final PreferencesState preferencesState = ref.watch(preferencesNotifierProvider);
    final PreferencesNotifier preferencesNotifier = ref.read(preferencesNotifierProvider.notifier);


    return AppLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Shapes.gutter),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: Shapes.gutter2x),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Shapes.gutter),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.settings,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: Shapes.gutter),
                  Text(
                    context.l10n.preferences,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Shapes.gutterSmall),
                  Text(
                    context.l10n.personalizeExperience,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Shapes.gutter),
            _SectionHeader(
              icon: Icons.palette_outlined,
              title: context.l10n.appearance,
            ),
            const SizedBox(height: Shapes.gutter),
            _SettingCard(
              icon: preferencesState.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              title: context.l10n.darkMode,
              subtitle: preferencesState.isDarkMode ? context.l10n.darkModeActive : context.l10n.lightModeActive,
              trailing: Switch(
                value: preferencesState.isDarkMode,
                onChanged: (value) {
                  preferencesNotifier.toggleDarkMode(value);
                },
              ),
            ),
            const SizedBox(height: Shapes.gutter2x),
            _SectionHeader(
              icon: Icons.language_outlined,
              title: context.l10n.language,
            ),
            const SizedBox(height: Shapes.gutter),
            const _LanguageCard(),
            const SizedBox(height: Shapes.gutter4x),
          ],
        ),
      ),
    );
  }
}
