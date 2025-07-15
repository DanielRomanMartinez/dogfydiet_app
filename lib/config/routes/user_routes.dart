import 'package:dogfydiet_app/ui/common/page_transactions/no_animation_page_transaction.dart';
import 'package:dogfydiet_app/ui/screens/user/profile_screen/profile_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> userRoutes = [
  GoRoute(
    path: ProfileScreen.routePath,
    name: ProfileScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const ProfileScreen(),
    ),
  ),
];
