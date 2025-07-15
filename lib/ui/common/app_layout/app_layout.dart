import 'package:dogfydiet_app/application/widgets/bottom_bar_navigation/bottom_bar_navigation_notifier.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/screens/preferences/preferences_screen/preferences_screen.dart';
import 'package:dogfydiet_app/ui/screens/user/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppLayout extends ConsumerStatefulWidget {
  final Widget child;
  final bool canPop;

  const AppLayout({
    super.key,
    required this.child,
    this.canPop = false,
  });

  @override
  ConsumerState<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends ConsumerState<AppLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateNavigationState();
    });
  }

  void _updateNavigationState() {
    final currentRoute = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
    ref.read(bottomBarNavigationNotifierProvider.notifier).updateCurrentRoute(currentRoute);
  }

  void _onItemTapped(int index) {
    ref.read(bottomBarNavigationNotifierProvider.notifier).updateCurrentIndex(index);

    switch (index) {
      case 0:
        context.go(HomeScreen.routePath);
        break;
      case 1:
        context.go(ProfileScreen.routePath);
        break;
      case 2:
        context.go(PreferencesScreen.routePath);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarState = ref.watch(bottomBarNavigationNotifierProvider);

    return PopScope(
      canPop: widget.canPop,
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/images/common/dogfy_diet_logo.svg',
            height: 50,
            width: 50,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomBarState.currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 8,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Preferences',
            ),
          ],
        ),
      ),
    );
  }
}