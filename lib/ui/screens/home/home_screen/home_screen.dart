import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/application/screens/home/home_screen/home_screen_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/ui/common/app_layout/app_layout.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/common/widgets/breed_selector.dart';
import 'package:dogfydiet_app/ui/screens/home/create_subscription_screen/create_subscription_screen.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/benefit_card.dart';
part 'widgets/benefits.dart';
part 'widgets/category_products.dart';
part 'widgets/create_subscription.dart';
part 'widgets/featured_product_card.dart';
part 'widgets/featured_products.dart';
part 'widgets/product_category.dart';
part 'widgets/why_choose_us.dart';
part 'widgets/why_choose_us_feature.dart';

class HomeScreen extends StatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _CreateSubscription(),
            _Benefits(),
            SizedBox(height: Shapes.gutter2x),
            _Products(),
            SizedBox(height: Shapes.gutter2x),
            _FeaturedProducts(),
            SizedBox(height: Shapes.gutter2x),
            _WhyChooseUs(),
            SizedBox(height: Shapes.gutter2x),
          ],
        ),
      ),
    );
  }
}
