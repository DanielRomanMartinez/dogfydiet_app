import 'package:dogfydiet_app/config/routes/home_routes.dart';
import 'package:dogfydiet_app/config/routes/preferences_routes.dart';
import 'package:dogfydiet_app/config/routes/user_routes.dart';
import 'package:dogfydiet_app/config/routes/splash_routes.dart';
import 'package:dogfydiet_app/ui/screens/error/page_not_found_screen/page_not_found_screen.dart';
import 'package:dogfydiet_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const PageNotFoundScreen(),
  redirect: (BuildContext context, GoRouterState state) {
    return state.matchedLocation;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        ...homeRoutes,
        ...preferencesRoutes,
        ...splashRoutes,
        ...userRoutes,
      ],
    ),
  ],
);

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
