import 'package:dogfydiet_app/application/widgets/bottom_bar_navigation/bottom_bar_navigation_notifier.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/screens/preferences/preferences_screen/preferences_screen.dart';
import 'package:dogfydiet_app/ui/screens/user/profile_screen/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('BottomBarNavigationNotifier', () {
    test('should return initial state', () {
      final state = container.read(bottomBarNavigationNotifierProvider);

      expect(state.currentIndex, 0);
      expect(state.currentRoute, HomeScreen.routePath);
    });

    test('should update current index and route', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentIndex(1);

      final state = container.read(bottomBarNavigationNotifierProvider);
      expect(state.currentIndex, 1);
      expect(state.currentRoute, ProfileScreen.routePath);
    });

    test('should update current route and index', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentRoute(PreferencesScreen.routePath);

      final state = container.read(bottomBarNavigationNotifierProvider);
      expect(state.currentIndex, 2);
      expect(state.currentRoute, PreferencesScreen.routePath);
    });

    test('should handle invalid index by defaulting to home', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentIndex(999);

      final state = container.read(bottomBarNavigationNotifierProvider);
      expect(state.currentIndex, 999);
      expect(state.currentRoute, HomeScreen.routePath);
    });

    test('should handle invalid route by defaulting to index 0', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentRoute('/invalid-route');

      final state = container.read(bottomBarNavigationNotifierProvider);
      expect(state.currentIndex, 0);
      expect(state.currentRoute, '/invalid-route');
    });

    test('should check if current route matches', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentRoute(ProfileScreen.routePath);

      expect(notifier.isCurrentRoute(ProfileScreen.routePath), true);
      expect(notifier.isCurrentRoute(HomeScreen.routePath), false);
      expect(notifier.isCurrentRoute(PreferencesScreen.routePath), false);
    });

    test('should check if current index matches', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentIndex(2);

      expect(notifier.isCurrentIndex(2), true);
      expect(notifier.isCurrentIndex(0), false);
      expect(notifier.isCurrentIndex(1), false);
    });

    test('should map all valid indices to correct routes', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentIndex(0);
      expect(container.read(bottomBarNavigationNotifierProvider).currentRoute, HomeScreen.routePath);

      notifier.updateCurrentIndex(1);
      expect(container.read(bottomBarNavigationNotifierProvider).currentRoute, ProfileScreen.routePath);

      notifier.updateCurrentIndex(2);
      expect(container.read(bottomBarNavigationNotifierProvider).currentRoute, PreferencesScreen.routePath);
    });

    test('should map all valid routes to correct indices', () {
      final notifier = container.read(bottomBarNavigationNotifierProvider.notifier);

      notifier.updateCurrentRoute('/home');
      expect(container.read(bottomBarNavigationNotifierProvider).currentIndex, 0);

      notifier.updateCurrentRoute(ProfileScreen.routePath);
      expect(container.read(bottomBarNavigationNotifierProvider).currentIndex, 1);

      notifier.updateCurrentRoute(PreferencesScreen.routePath);
      expect(container.read(bottomBarNavigationNotifierProvider).currentIndex, 2);
    });
  });

  group('BottomBarNavigationState', () {
    test('should create state with correct values', () {
      const state = BottomBarNavigationState(
        currentIndex: 1,
        currentRoute: ProfileScreen.routePath,
      );

      expect(state.currentIndex, 1);
      expect(state.currentRoute, ProfileScreen.routePath);
    });

    test('should create new state with copyWith', () {
      const initialState = BottomBarNavigationState(
        currentIndex: 0,
        currentRoute: '/home',
      );

      final newState = initialState.copyWith(
        currentIndex: 2,
        currentRoute: PreferencesScreen.routePath,
      );

      expect(newState.currentIndex, 2);
      expect(newState.currentRoute, PreferencesScreen.routePath);
    });

    test('should preserve existing values when copyWith is called with null', () {
      const initialState = BottomBarNavigationState(
        currentIndex: 1,
        currentRoute: ProfileScreen.routePath,
      );

      final newState = initialState.copyWith();

      expect(newState.currentIndex, 1);
      expect(newState.currentRoute, ProfileScreen.routePath);
    });

    test('should support equality', () {
      const state1 = BottomBarNavigationState(
        currentIndex: 1,
        currentRoute: ProfileScreen.routePath,
      );

      const state2 = BottomBarNavigationState(
        currentIndex: 1,
        currentRoute: ProfileScreen.routePath,
      );

      expect(state1, equals(state2));
    });

    test('should support inequality', () {
      const state1 = BottomBarNavigationState(
        currentIndex: 1,
        currentRoute: ProfileScreen.routePath,
      );

      const state2 = BottomBarNavigationState(
        currentIndex: 2,
        currentRoute: PreferencesScreen.routePath,
      );

      expect(state1, isNot(equals(state2)));
    });
  });
}
