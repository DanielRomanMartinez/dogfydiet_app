import 'package:dogfydiet_app/application/screens/splash_screen/splash_screen_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/services/core/router_service.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/screens/user/profile_screen/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_screen_notifier_test.mocks.dart';

@GenerateMocks([RouterService])
void main() {
  late MockRouterService mockRouterService;
  late ProviderContainer container;

  setUp(() {
    mockRouterService = MockRouterService();
    container = ProviderContainer(
      overrides: [
        routerServiceProvider.overrideWithValue(mockRouterService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('SplashScreenNotifier', () {
    test('should return initial state', () {
      final state = container.read(splashScreenNotifierProvider);

      expect(state.isLoading, false);
      expect(state.nextPage, isNull);
      expect(state.error, isNull);
      expect(state.hasNextPage, false);
      expect(state.hasError, false);
      expect(state.isInitial, true);
    });

    test('should get next page successfully', () async {
      const nextPage = HomeScreen.routePath;
      when(mockRouterService.getNextPage()).thenAnswer((_) async => nextPage);

      final notifier = container.read(splashScreenNotifierProvider.notifier);

      final states = <SplashScreenState>[];
      container.listen<SplashScreenState>(
        splashScreenNotifierProvider,
            (previous, next) {
          states.add(next);
        },
      );

      notifier.getNextPage();

      await Future.delayed(const Duration(milliseconds: 600));

      expect(states.length, greaterThanOrEqualTo(2));
      expect(states.first.isLoading, true);
      expect(states.last.isLoading, false);
      expect(states.last.nextPage, nextPage);
      expect(states.last.error, isNull);
      expect(states.last.hasNextPage, true);
      expect(states.last.hasError, false);
      expect(states.last.isInitial, false);
      verify(mockRouterService.getNextPage()).called(1);
    });

    test('should handle error when getting next page', () async {
      const errorMessage = 'Network error';
      when(mockRouterService.getNextPage()).thenThrow(Exception(errorMessage));

      final notifier = container.read(splashScreenNotifierProvider.notifier);

      final states = <SplashScreenState>[];
      container.listen<SplashScreenState>(
        splashScreenNotifierProvider,
            (previous, next) {
          states.add(next);
        },
      );

      notifier.getNextPage();

      await Future.delayed(const Duration(milliseconds: 600));

      expect(states.length, greaterThanOrEqualTo(2));
      expect(states.first.isLoading, true);
      expect(states.last.isLoading, false);
      expect(states.last.nextPage, isNull);
      expect(states.last.error, contains(errorMessage));
      expect(states.last.hasNextPage, false);
      expect(states.last.hasError, true);
      expect(states.last.isInitial, false);
      verify(mockRouterService.getNextPage()).called(1);
    });

    test('should set loading state when getting next page', () {
      when(mockRouterService.getNextPage()).thenAnswer((_) async => HomeScreen.routePath);

      final notifier = container.read(splashScreenNotifierProvider.notifier);
      notifier.getNextPage();

      final state = container.read(splashScreenNotifierProvider);
      expect(state.isLoading, true);
      expect(state.nextPage, isNull);
      expect(state.error, isNull);
      expect(state.hasNextPage, false);
      expect(state.hasError, false);
      expect(state.isInitial, false);
    });

    test('should clear error', () async {
      when(mockRouterService.getNextPage()).thenThrow(Exception('Error'));
      final notifier = container.read(splashScreenNotifierProvider.notifier);

      final states = <SplashScreenState>[];
      container.listen<SplashScreenState>(
        splashScreenNotifierProvider,
            (previous, next) {
          states.add(next);
        },
      );

      notifier.getNextPage();
      await Future.delayed(const Duration(milliseconds: 600));

      expect(states.isNotEmpty, true);
      expect(states.last.hasError, true);

      notifier.clearError();

      final state = container.read(splashScreenNotifierProvider);
      expect(state.error, isNull);
      expect(state.isInitial, true);
    });

    test('should reset to initial state', () {
      when(mockRouterService.getNextPage()).thenAnswer((_) async => HomeScreen.routePath);
      final notifier = container.read(splashScreenNotifierProvider.notifier);

      notifier.getNextPage();
      notifier.reset();

      final state = container.read(splashScreenNotifierProvider);
      expect(state.isLoading, false);
      expect(state.nextPage, isNull);
      expect(state.error, isNull);
      expect(state.hasNextPage, false);
      expect(state.hasError, false);
      expect(state.isInitial, true);
    });

    test('should handle multiple getNextPage calls', () async {
      const nextPage = HomeScreen.routePath;
      when(mockRouterService.getNextPage()).thenAnswer((_) async => nextPage);

      final notifier = container.read(splashScreenNotifierProvider.notifier);

      final states = <SplashScreenState>[];
      container.listen<SplashScreenState>(
        splashScreenNotifierProvider,
            (previous, next) {
          states.add(next);
        },
      );

      notifier.getNextPage();
      notifier.getNextPage();

      await Future.delayed(const Duration(milliseconds: 600));

      expect(states.isNotEmpty, true);
      expect(states.last.nextPage, nextPage);
      verify(mockRouterService.getNextPage()).called(2);
    });

    test('should handle reset after successful navigation', () async {
      const nextPage = HomeScreen.routePath;
      when(mockRouterService.getNextPage()).thenAnswer((_) async => nextPage);

      final notifier = container.read(splashScreenNotifierProvider.notifier);
      notifier.getNextPage();
      await Future.delayed(const Duration(milliseconds: 600));
      notifier.reset();

      final state = container.read(splashScreenNotifierProvider);
      expect(state.isInitial, true);
      expect(state.nextPage, isNull);
    });
  });

  group('SplashScreenState', () {
    test('should create initial state', () {
      const state = SplashScreenState.initial();

      expect(state.isLoading, false);
      expect(state.nextPage, isNull);
      expect(state.error, isNull);
      expect(state.hasNextPage, false);
      expect(state.hasError, false);
      expect(state.isInitial, true);
    });

    test('should create loading state', () {
      const state = SplashScreenState.loading();

      expect(state.isLoading, true);
      expect(state.nextPage, isNull);
      expect(state.error, isNull);
      expect(state.hasNextPage, false);
      expect(state.hasError, false);
      expect(state.isInitial, false);
    });

    test('should create success state', () {
      const nextPage = HomeScreen.routePath;
      const state = SplashScreenState.success(nextPage: nextPage);

      expect(state.isLoading, false);
      expect(state.nextPage, nextPage);
      expect(state.error, isNull);
      expect(state.hasNextPage, true);
      expect(state.hasError, false);
      expect(state.isInitial, false);
    });

    test('should create error state', () {
      const errorMessage = 'Network error';
      const state = SplashScreenState.error(error: errorMessage);

      expect(state.isLoading, false);
      expect(state.nextPage, isNull);
      expect(state.error, errorMessage);
      expect(state.hasNextPage, false);
      expect(state.hasError, true);
      expect(state.isInitial, false);
    });

    test('should support equality', () {
      const state1 = SplashScreenState.initial();
      const state2 = SplashScreenState.initial();

      expect(state1, equals(state2));
    });

    test('should support inequality', () {
      const state1 = SplashScreenState.initial();
      const state2 = SplashScreenState.loading();

      expect(state1, isNot(equals(state2)));
    });

    test('should handle success state with same nextPage', () {
      const nextPage = HomeScreen.routePath;
      const state1 = SplashScreenState.success(nextPage: nextPage);
      const state2 = SplashScreenState.success(nextPage: nextPage);

      expect(state1, equals(state2));
    });

    test('should handle error state with same error', () {
      const errorMessage = 'Network error';
      const state1 = SplashScreenState.error(error: errorMessage);
      const state2 = SplashScreenState.error(error: errorMessage);

      expect(state1, equals(state2));
    });

    test('should handle different success states', () {
      const state1 = SplashScreenState.success(nextPage: HomeScreen.routePath);
      const state2 = SplashScreenState.success(nextPage: ProfileScreen.routePath);

      expect(state1, isNot(equals(state2)));
    });

    test('should handle different error states', () {
      const state1 = SplashScreenState.error(error: 'Error 1');
      const state2 = SplashScreenState.error(error: 'Error 2');

      expect(state1, isNot(equals(state2)));
    });
  });
}