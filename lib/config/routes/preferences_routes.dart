import 'package:dogfydiet_app/ui/common/page_transactions/no_animation_page_transaction.dart';
import 'package:dogfydiet_app/ui/screens/preferences/preferences_screen/preferences_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> preferencesRoutes = [
  GoRoute(
    path: PreferencesScreen.routePath,
    name: PreferencesScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const PreferencesScreen(),
    ),
  ),
];
