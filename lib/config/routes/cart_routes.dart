import 'package:dogfydiet_app/ui/common/page_transactions/no_animation_page_transaction.dart';
import 'package:dogfydiet_app/ui/screens/cart/cart_screen/cart_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> cartRoutes = [
  GoRoute(
    path: CartScreen.routePath,
    name: CartScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const CartScreen(),
    ),
  ),
];
