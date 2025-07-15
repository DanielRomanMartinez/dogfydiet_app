import 'package:dogfydiet_app/ui/common/page_transactions/no_animation_page_transaction.dart';
import 'package:dogfydiet_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> splashRoutes = [
  GoRoute(
    path: SplashScreen.routePath,
    name: SplashScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const SplashScreen(),
    ),
  ),
];
