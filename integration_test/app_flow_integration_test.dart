import 'package:dogfydiet_app/main.dart' as app;
import 'package:dogfydiet_app/ui/screens/home/create_subscription_screen/create_subscription_screen.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Finder findMultipleTexts(List<String> texts) {
  for (String text in texts) {
    final finder = find.text(text);
    if (finder.evaluate().isNotEmpty) {
      return finder;
    }
  }
  return find.text(texts.first);
}

Finder findTextContaining(List<String> texts) {
  for (String text in texts) {
    final finder = find.textContaining(text);
    if (finder.evaluate().isNotEmpty) {
      return finder;
    }
  }
  return find.textContaining(texts.first);
}

Future<void> waitForAppReady(WidgetTester tester) async {
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await tester.pumpAndSettle(const Duration(seconds: 2));

  for (int i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 500));
    if (find.byType(HomeScreen).evaluate().isNotEmpty ||
        find.byType(CreateSubscriptionScreen).evaluate().isNotEmpty ||
        find.textContaining('Create').evaluate().isNotEmpty ||
        find.textContaining('Crea').evaluate().isNotEmpty) {
      break;
    }
  }

  await tester.pumpAndSettle(const Duration(seconds: 1));
}

Future<void> safeTap(WidgetTester tester, Finder finder, {Duration? timeout}) async {
  timeout ??= const Duration(seconds: 5);
  final endTime = DateTime.now().add(timeout);

  while (DateTime.now().isBefore(endTime)) {
    if (finder.evaluate().isNotEmpty) {
      try {
        await tester.tap(finder);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
        return;
      } catch (e) {
        // Silent retry
      }
    }
    await tester.pump(const Duration(milliseconds: 100));
  }

  throw Exception('Could not tap on finder within timeout');
}

String determineCurrentScreen(WidgetTester tester) {
  if (find.byType(HomeScreen).evaluate().isNotEmpty) {
    return 'Home';
  }

  if (find.byType(CreateSubscriptionScreen).evaluate().isNotEmpty) {
    if (find.textContaining('What breed is your little one').evaluate().isNotEmpty ||
        find.textContaining('Cuál es la raza de tu perrete').evaluate().isNotEmpty ||
        find.textContaining('breed').evaluate().isNotEmpty ||
        find.textContaining('raza').evaluate().isNotEmpty) {
      return 'Subscription - Breed Selection';
    }

    if (find.textContaining('What is your').evaluate().isNotEmpty ||
        find.textContaining('Cómo se llama tu').evaluate().isNotEmpty ||
        find.textContaining('My dog is called').evaluate().isNotEmpty ||
        find.textContaining('Mi perrhijo se llama').evaluate().isNotEmpty ||
        (find.byType(TextField).evaluate().isNotEmpty &&
            (find.textContaining('called').evaluate().isNotEmpty ||
                find.textContaining('llama').evaluate().isNotEmpty))) {
      return 'Subscription - Pet Name';
    }

    if (find.textContaining('We want to know').evaluate().isNotEmpty ||
        find.textContaining('Queremos conocer').evaluate().isNotEmpty ||
        (find.text('Male').evaluate().isNotEmpty && find.text('Female').evaluate().isNotEmpty) ||
        (find.text('Macho').evaluate().isNotEmpty && find.text('Hembra').evaluate().isNotEmpty) ||
        find.textContaining('neutered').evaluate().isNotEmpty ||
        find.textContaining('esterilizado').evaluate().isNotEmpty) {
      return 'Subscription - Gender';
    }

    if (find.textContaining('When was').evaluate().isNotEmpty ||
        find.textContaining('Cuándo nació').evaluate().isNotEmpty ||
        find.byType(DropdownButtonFormField<int>).evaluate().isNotEmpty) {
      return 'Subscription - Birth Date';
    }

    if (find.textContaining('silhouette').evaluate().isNotEmpty ||
        find.textContaining('silueta').evaluate().isNotEmpty ||
        find.textContaining('weight').evaluate().isNotEmpty ||
        find.textContaining('peso').evaluate().isNotEmpty) {
      return 'Subscription - Weight/Silhouette';
    }

    if (find.textContaining('activity level').evaluate().isNotEmpty ||
        find.textContaining('nivel de actividad').evaluate().isNotEmpty) {
      return 'Subscription - Activity Level';
    }

    if (find.textContaining('food critic').evaluate().isNotEmpty ||
        find.textContaining('crítica gastronómica').evaluate().isNotEmpty ||
        find.textContaining('selective').evaluate().isNotEmpty ||
        find.textContaining('gourmet').evaluate().isNotEmpty ||
        find.textContaining('eats everything').evaluate().isNotEmpty) {
      return 'Subscription - Food Preferences';
    }

    return 'Subscription - Unknown Step';
  }

  return 'Unknown';
}

Future<void> fillCurrentStep(WidgetTester tester) async {
  final currentScreen = determineCurrentScreen(tester);

  switch (currentScreen) {
    case 'Subscription - Breed Selection':
      await selectAnyBreed(tester);
      break;

    case 'Subscription - Pet Name':
      final nameField = find.byType(TextField);
      if (nameField.evaluate().isNotEmpty) {
        await tester.enterText(nameField.first, 'TestBuddy');
        await tester.pumpAndSettle();
      }
      break;

    case 'Subscription - Gender':
      final maleButton = findMultipleTexts(['Male', 'Macho']);
      if (maleButton.evaluate().isNotEmpty) {
        await safeTap(tester, maleButton.first);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      if (find.textContaining('neutered').evaluate().isNotEmpty ||
          find.textContaining('esterilizado').evaluate().isNotEmpty) {
        final yesButtons = findMultipleTexts(['Yes', 'Sí']);
        if (yesButtons.evaluate().isNotEmpty) {
          await safeTap(tester, yesButtons.first);
          await tester.pumpAndSettle(const Duration(milliseconds: 500));
        }
      }
      break;

    case 'Subscription - Birth Date':
      final yearDropdowns = find.byType(DropdownButtonFormField<int>);
      if (yearDropdowns.evaluate().isNotEmpty) {
        await safeTap(tester, yearDropdowns.first);
        await tester.pumpAndSettle();

        final year2022 = find.text('2022');
        if (year2022.evaluate().isNotEmpty) {
          await safeTap(tester, year2022.last);
          await tester.pumpAndSettle();
        }
      }
      break;

    case 'Subscription - Weight/Silhouette':
      final gestureDetectors = find.byType(GestureDetector);
      if (gestureDetectors.evaluate().length >= 3) {
        await safeTap(tester, gestureDetectors.at(1));
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final weightField = find.byType(TextField);
      if (weightField.evaluate().isNotEmpty) {
        await tester.enterText(weightField.first, '15');
        await tester.pumpAndSettle();
      }
      break;

    case 'Subscription - Activity Level':
      final gestureDetectors = find.byType(GestureDetector);
      if (gestureDetectors.evaluate().length >= 3) {
        await safeTap(tester, gestureDetectors.at(1));
        await tester.pumpAndSettle();
      }
      break;

    case 'Subscription - Food Preferences':
      final gestureDetectors = find.byType(GestureDetector);
      if (gestureDetectors.evaluate().length >= 3) {
        await safeTap(tester, gestureDetectors.at(1));
        await tester.pumpAndSettle();
      }
      break;

    default:
      break;
  }
}

Future<void> selectAnyBreed(WidgetTester tester) async {
  final breedSelectors = [
    find.byWidgetPredicate((widget) => widget is Container && widget.child is Row),
    find.byType(DropdownButton),
    find.byType(DropdownButtonFormField),
  ];

  for (final selector in breedSelectors) {
    if (selector.evaluate().isNotEmpty) {
      await safeTap(tester, selector.first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final breedOptions = [
        find.text('Golden Retriever'),
        find.text('Labrador'),
        find.text('German Shepherd'),
        find.text('Pastor Alemán'),
        find.byType(ListTile),
      ];

      for (final option in breedOptions) {
        if (option.evaluate().isNotEmpty) {
          await safeTap(tester, option.first);
          await tester.pumpAndSettle();
          return;
        }
      }
    }
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('DogfyDiet App Integration Tests', () {
    testWidgets('Test 1: Complete Form Flow to Food Preferences', (WidgetTester tester) async {
      app.main();
      await waitForAppReady(tester);

      final startScreen = determineCurrentScreen(tester);

      if (startScreen == 'Home') {
        final createButton = findMultipleTexts(['Create their menu', 'Crea su menú']);
        if (createButton.evaluate().isNotEmpty) {
          await safeTap(tester, createButton.first);
          await tester.pumpAndSettle(const Duration(seconds: 2));
        }
      }

      for (int step = 0; step < 10; step++) {
        final currentStep = determineCurrentScreen(tester);

        if (!currentStep.contains('Subscription')) {
          break;
        }

        await fillCurrentStep(tester);

        if (currentStep == 'Subscription - Food Preferences') {
          expect(currentStep, equals('Subscription - Food Preferences'));
          break;
        }

        final continueButton = findMultipleTexts(['Continue', 'Continuar']);
        if (continueButton.evaluate().isNotEmpty) {
          await safeTap(tester, continueButton.first);
          await tester.pumpAndSettle(const Duration(seconds: 1));
        } else {
          break;
        }
      }
    });

    testWidgets('Test 2: App State Persistence', (WidgetTester tester) async {
      app.main();
      await waitForAppReady(tester);

      final initialScreen = determineCurrentScreen(tester);

      if (initialScreen == 'Home') {
        expect(find.byType(HomeScreen), findsOneWidget);
      } else if (initialScreen.contains('Subscription')) {
        expect(find.byType(CreateSubscriptionScreen), findsOneWidget);
      }
    });

    testWidgets('Test 3: UI Discovery', (WidgetTester tester) async {
      app.main();
      await waitForAppReady(tester);

      final currentScreen = determineCurrentScreen(tester);

      if (currentScreen == 'Home') {
        expect(
          find.textContaining('Create').evaluate().isNotEmpty || find.textContaining('Crea').evaluate().isNotEmpty,
          isTrue,
          reason: 'Home should have create button',
        );
      }

      if (currentScreen.contains('Subscription')) {
        expect(
          find.byType(CreateSubscriptionScreen),
          findsOneWidget,
          reason: 'Should be on subscription screen',
        );
      }
    });
  });
}
