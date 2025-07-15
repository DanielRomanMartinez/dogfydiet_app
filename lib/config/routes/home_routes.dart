import 'package:dogfydiet_app/ui/common/page_transactions/no_animation_page_transaction.dart';
import 'package:dogfydiet_app/ui/screens/home/create_subscription_screen/create_subscription_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/pay_subscription_screen/pay_subscription_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/summary_subscription_screen/summary_subscription_screen.dart';
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
  GoRoute(
    path: CreateSubscriptionScreen.routePath,
    name: CreateSubscriptionScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const CreateSubscriptionScreen(),
    ),
  ),
  GoRoute(
    path: PaySubscriptionScreen.routePath,
    name: PaySubscriptionScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const PaySubscriptionScreen(),
    ),
  ),
  GoRoute(
    path: SummarySubscriptionScreen.routePath,
    name: SummarySubscriptionScreen.routeName,
    pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
      context: context,
      state: state,
      child: const SummarySubscriptionScreen(),
    ),
  ),
];
