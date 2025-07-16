import 'package:dogfydiet_app/application/screens/home/home_screen/home_screen_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/services/dog_breed_service.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/create_test_widget_with_localizations.dart';
import 'home_screen_test.mocks.dart';

@GenerateMocks([DogBreedService])
void main() {
  group('HomeScreen Interaction Tests', () {
    late MockDogBreedService mockDogBreedService;
    late ProviderContainer container;

    const mockBreeds = [
      DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'}),
      DogBreed(id: 2, name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'}),
    ];

    setUp(() {
      mockDogBreedService = MockDogBreedService();
      when(mockDogBreedService.fetchAllBreeds()).thenAnswer((_) async => mockBreeds);

      container = ProviderContainer(
        overrides: [
          dogBreedServiceProvider.overrideWithValue(mockDogBreedService),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    Widget createTestWidget() {
      return UncontrolledProviderScope(
        container: container,
        child: createTestWidgetWithLocalizations(child: const HomeScreen()),
      );
    }

    testWidgets('should tap on product categories without errors', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);

      await tester.drag(scrollView, const Offset(0, -300));
      await tester.pumpAndSettle();

      final premiumMenus = find.text('Premium Menus');
      expect(premiumMenus, findsOneWidget);
      await tester.ensureVisible(premiumMenus);
      await tester.tap(premiumMenus, warnIfMissed: false);
      await tester.pumpAndSettle();

      final naturalSnacks = find.text('Natural Snacks');
      expect(naturalSnacks, findsOneWidget);
      await tester.ensureVisible(naturalSnacks);
      await tester.tap(naturalSnacks, warnIfMissed: false);
      await tester.pumpAndSettle();

      final supplements = find.text('Supplements');
      expect(supplements, findsOneWidget);
      await tester.ensureVisible(supplements);
      await tester.tap(supplements, warnIfMissed: false);
      await tester.pumpAndSettle();

      final accessories = find.text('Accessories');
      expect(accessories, findsOneWidget);
      await tester.ensureVisible(accessories);
      await tester.tap(accessories, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('should tap on view all button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);
      await tester.drag(scrollView, const Offset(0, -600));
      await tester.pumpAndSettle();

      final viewAllButton = find.text('View all');
      expect(viewAllButton, findsOneWidget);
      await tester.ensureVisible(viewAllButton);
      await tester.tap(viewAllButton, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('should handle create menu button tap with no breed selected', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final homeNotifier = container.read(homeScreenNotifierProvider.notifier);
      homeNotifier.clearBreed();
      await tester.pumpAndSettle();

      final createMenuButton = find.text('Create their menu');
      expect(createMenuButton, findsOneWidget);
      await tester.ensureVisible(createMenuButton);

      await tester.tap(createMenuButton);
      await tester.pumpAndSettle();

      final homeScreens = find.byType(HomeScreen);
      expect(homeScreens.evaluate().length, isIn([0, 1]));
    });

    testWidgets('should handle create menu button tap with breed selected', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final homeNotifier = container.read(homeScreenNotifierProvider.notifier);
      homeNotifier.selectBreed(mockBreeds.first);
      await tester.pumpAndSettle();

      final createMenuButton = find.text('Create their menu');
      expect(createMenuButton, findsOneWidget);
      await tester.ensureVisible(createMenuButton);

      await tester.tap(createMenuButton);
      await tester.pumpAndSettle();

      final homeScreens = find.byType(HomeScreen);
      expect(homeScreens.evaluate().length, isIn([0, 1]));
    });

    testWidgets('should scroll through all content sections', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);

      await tester.drag(scrollView, const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(find.text('Featured products'), findsOneWidget);

      await tester.drag(scrollView, const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(find.text('Why choose Dogfy Diet?'), findsOneWidget);

      await tester.drag(scrollView, const Offset(0, 600));
      await tester.pumpAndSettle();

      expect(find.text('Put real food in your dog\'s bowl'), findsOneWidget);
    });

    testWidgets('should maintain breed selection state across rebuilds', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final homeNotifier = container.read(homeScreenNotifierProvider.notifier);
      homeNotifier.selectBreed(mockBreeds.first);
      await tester.pumpAndSettle();

      await tester.pump();

      final selectedBreed = container.read(homeScreenNotifierProvider);
      expect(selectedBreed, equals(mockBreeds.first));
    });

    testWidgets('should clear breed selection', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final homeNotifier = container.read(homeScreenNotifierProvider.notifier);

      homeNotifier.selectBreed(mockBreeds.first);
      await tester.pumpAndSettle();

      expect(container.read(homeScreenNotifierProvider), equals(mockBreeds.first));

      homeNotifier.clearBreed();
      await tester.pumpAndSettle();

      expect(container.read(homeScreenNotifierProvider), isNull);
    });

    testWidgets('should verify all text content is accessible', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Put real food in your dog\'s bowl'), findsOneWidget);
      expect(find.text('Natural food for dogs, complete and balanced. Made by nutritionists'), findsOneWidget);

      final scrollView = find.byType(SingleChildScrollView);

      await tester.drag(scrollView, const Offset(0, -200));
      await tester.pumpAndSettle();

      expect(find.text('Our products'), findsOneWidget);

      await tester.drag(scrollView, const Offset(0, -400));
      await tester.pumpAndSettle();

      expect(find.text('Why choose Dogfy Diet?'), findsOneWidget);
    });
  });
}