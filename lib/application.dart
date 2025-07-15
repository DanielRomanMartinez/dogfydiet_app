import 'package:dogfydiet_app/application/screens/preferences/preferences_screen/preferences_screen_notifier.dart';
import 'package:dogfydiet_app/config/app_scroll_behaviour.dart';
import 'package:dogfydiet_app/config/auto_generated/l10n/app_localizations.dart';
import 'package:dogfydiet_app/config/routes/router.dart';
import 'package:dogfydiet_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogfyDiet extends ConsumerWidget {
  const DogfyDiet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesState = ref.watch(preferencesNotifierProvider);

    return MaterialApp.router(
      title: 'Dogfy Diet',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const AppScrollBehaviour(),
      routerConfig: router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: preferencesState.themeMode,
      locale: preferencesState.currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}