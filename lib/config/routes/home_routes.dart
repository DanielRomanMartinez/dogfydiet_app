import 'package:dogfydiet_app/ui/common/page_transactions/no_animation_page_transaction.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> homeRoutes = [
  GoRoute(
    path: HomeScreen.routePath,
    name: HomeScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const HomeScreen(),
    ),
  ),
];
