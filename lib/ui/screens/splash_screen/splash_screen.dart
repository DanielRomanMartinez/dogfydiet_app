import 'package:dogfydiet_app/application/screens/splash_screen/splash_screen_notifier.dart';
import 'package:dogfydiet_app/ui/theme/colors_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'splash';

  const SplashScreen({
    super.key,
  });

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashScreenNotifierProvider.notifier).getNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SplashScreenState>(splashScreenNotifierProvider, (previous, next) {
      if (next.hasNextPage && mounted) {
        context.go(next.nextPage!);
      }
    });

    return Scaffold(
      body: ColoredBox(
        color: ColorsMap.primaryColor,
        child: Center(
          child: SvgPicture.asset(
            'assets/images/common/dogfy_diet_logo.svg',
            height: 80,
            width: 80,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
