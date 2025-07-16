import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import '../mocks/mock_app_localizations.dart';

// Helper function to create test widget with proper localization setup
Widget createTestWidgetWithLocalizations({
  required Widget child,
  Locale locale = const Locale('en'),
}) {
  // Create a simple GoRouter for testing
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(body: child),
      ),
    ],
  );

  return MaterialApp.router(
    locale: locale,
    routerConfig: router,
    localizationsDelegates: const [
      MockLocalizationDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en'),
      Locale('es'),
      Locale('fr'),
      Locale('it'),
    ],
  );
}
