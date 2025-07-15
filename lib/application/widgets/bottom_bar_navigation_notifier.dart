import 'package:dogfydiet_app/ui/screens/cart/cart_screen/cart_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/screens/preferences/preferences_screen/preferences_screen.dart';
import 'package:dogfydiet_app/ui/screens/user/profile_screen/profile_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_bar_navigation_notifier.g.dart';

@riverpod
class BottomBarNavigationNotifier extends _$BottomBarNavigationNotifier {
  @override
  BottomBarNavigationState build() {
    return const BottomBarNavigationState(
      currentIndex: 0,
      currentRoute: HomeScreen.routePath,
    );
  }

  void updateCurrentIndex(int index) {
    final route = _getRouteFromIndex(index);
    state = state.copyWith(
      currentIndex: index,
      currentRoute: route,
    );
  }

  void updateCurrentRoute(String route) {
    final index = _getIndexFromRoute(route);
    state = state.copyWith(
      currentIndex: index,
      currentRoute: route,
    );
  }

  String _getRouteFromIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen.routePath;
      case 1:
        return ProfileScreen.routePath;
      case 2:
        return CartScreen.routePath;
      case 3:
        return PreferencesScreen.routePath;
      default:
        return HomeScreen.routePath;
    }
  }

  int _getIndexFromRoute(String route) {
    switch (route) {
      case HomeScreen.routePath:
        return 0;
      case ProfileScreen.routePath:
        return 1;
      case CartScreen.routePath:
        return 2;
      case PreferencesScreen.routePath:
        return 3;
      default:
        return 0;
    }
  }

  bool isCurrentRoute(String route) {
    return state.currentRoute == route;
  }

  bool isCurrentIndex(int index) {
    return state.currentIndex == index;
  }
}

class BottomBarNavigationState extends Equatable {
  final int currentIndex;
  final String currentRoute;

  const BottomBarNavigationState({
    required this.currentIndex,
    required this.currentRoute,
  });

  BottomBarNavigationState copyWith({
    int? currentIndex,
    String? currentRoute,
  }) {
    return BottomBarNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
        currentRoute,
      ];
}
