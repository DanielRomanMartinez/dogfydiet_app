import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/create_subscription_screen/create_subscription_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/summary_subscription_screen/summary_subscription_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/pay_subscription_screen/pay_subscription_screen.dart';
import 'package:dogfydiet_app/domain/services/subscription_service.dart';

class RouterService {
  final SubscriptionService subscriptionService;

  const RouterService({
    required this.subscriptionService,
  });

  Future<String> getNextPage() async {
    try {
      final savedForm = await subscriptionService.getProgress();

      if (savedForm == null) {
        return HomeScreen.routePath;
      }

      if (savedForm.isCompleted) {
        return PaySubscriptionScreen.routePath;
      }

      if (savedForm.currentStep >= savedForm.totalSteps - 1 && savedForm.isCurrentStepValid()) {
        return SummarySubscriptionScreen.routePath;
      }

      return CreateSubscriptionScreen.routePath;
    } catch (e) {
      return HomeScreen.routePath;
    }
  }
}
