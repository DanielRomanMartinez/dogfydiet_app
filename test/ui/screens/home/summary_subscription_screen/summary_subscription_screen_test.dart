import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';
import 'package:dogfydiet_app/ui/screens/home/summary_subscription_screen/summary_subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/create_test_widget_with_localizations.dart';

const mockBreed = DogBreed(
  id: 1,
  name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'},
);

final mockFormWithPetName = SubscriptionForm(
  selectedBreed: mockBreed,
  petName: 'Max',
  petGender: 'male',
  petNeutered: true,
  petBirthDate: DateTime(2022, 1, 1),
  petWeight: 25.0,
  activityLevel: 'medium',
  foodPreferences: 'gourmet',
  ownerEmail: 'test@example.com',
  ownerPhone: '123456789',
  currentStep: SubscriptionForm.stepOwnerDetails,
  isCompleted: false,
);

final mockFormWithoutPetName = mockFormWithPetName.copyWith(petName: null);

final mockStateWithPetName = CreateSubscriptionScreenState(
  form: mockFormWithPetName,
  isLoading: false,
  error: null,
  isSubmitting: false,
);

final mockStateWithoutPetName = CreateSubscriptionScreenState(
  form: mockFormWithoutPetName,
  isLoading: false,
  error: null,
  isSubmitting: false,
);

void main() {
  group('SummarySubscriptionScreen Tests', () {
    Widget createTestWidget(CreateSubscriptionScreenState state) {
      return ProviderScope(
        overrides: [
          createSubscriptionScreenNotifierProvider.overrideWith(
            () => _TestCreateSubscriptionScreenNotifier(state),
          ),
        ],
        child: createTestWidgetWithLocalizations(
          child: const SummarySubscriptionScreen(),
        ),
      );
    }

    testWidgets('should render screen without errors', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.byType(SummarySubscriptionScreen), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display continue button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle button tap without errors', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final continueButton = find.text('Continue');
      expect(continueButton, findsOneWidget);

      await tester.ensureVisible(continueButton);
      await tester.pumpAndSettle();

      await tester.tap(continueButton, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display recommended badge', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.text('RECOMMENDED'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('should display pricing information', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.byType(RichText), findsAtLeastNWidgets(1));
    });

    testWidgets('should display discount information', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.textContaining('30'), findsAtLeastNWidgets(1));
      expect(find.textContaining('🎉'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display benefit percentages', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);
      await tester.drag(scrollView, const Offset(0, -400));
      await tester.pumpAndSettle();

      expect(find.text('92,1%'), findsOneWidget);
      expect(find.text('87,4%'), findsOneWidget);
      expect(find.text('74%'), findsOneWidget);
    });

    testWidgets('should display benefit emojis', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);
      await tester.drag(scrollView, const Offset(0, -400));
      await tester.pumpAndSettle();

      expect(find.text('🏃‍♀️'), findsOneWidget);
      expect(find.text('🐕'), findsOneWidget);
      expect(find.text('✨'), findsOneWidget);
    });

    testWidgets('should be scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);
      expect(scrollView, findsOneWidget);

      await tester.drag(scrollView, const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);

      await tester.drag(scrollView, const Offset(0, 300));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display subscription plan card structure', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final containers = find.byWidgetPredicate(
        (widget) => widget is Container && widget.decoration != null && widget.padding != null,
      );
      expect(containers, findsAtLeastNWidgets(1));

      expect(find.byType(RichText), findsAtLeastNWidgets(1));
    });

    testWidgets('should display trial period information', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.textContaining('14'), findsAtLeastNWidgets(1));
    });

    testWidgets('should work without pet name', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithoutPetName));
      await tester.pumpAndSettle();

      expect(find.byType(SummarySubscriptionScreen), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display benefit items in row layout', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView);
      await tester.drag(scrollView, const Offset(0, -400));
      await tester.pumpAndSettle();

      final benefitRow = find.byWidgetPredicate(
        (widget) => widget is Row && widget.mainAxisAlignment == MainAxisAlignment.spaceEvenly,
      );
      expect(benefitRow, findsAtLeastNWidgets(1));

      final expandedWidgets = find.byWidgetPredicate(
        (widget) => widget is Expanded,
      );
      expect(expandedWidgets, findsAtLeastNWidgets(3));
    });

    testWidgets('should handle loading state', (WidgetTester tester) async {
      const loadingState = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: true,
        error: null,
        isSubmitting: false,
      );

      await tester.pumpWidget(createTestWidget(loadingState));
      await tester.pumpAndSettle();

      expect(find.byType(SummarySubscriptionScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle error state', (WidgetTester tester) async {
      const errorState = CreateSubscriptionScreenState(
        form: SubscriptionForm(),
        isLoading: false,
        error: 'Test error',
        isSubmitting: false,
      );

      await tester.pumpWidget(createTestWidget(errorState));
      await tester.pumpAndSettle();

      expect(find.byType(SummarySubscriptionScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display gradient background', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      final decoratedContainers = find.byWidgetPredicate(
        (widget) => widget is Container && widget.decoration is BoxDecoration,
      );
      expect(decoratedContainers, findsAtLeastNWidgets(1));
    });

    testWidgets('should have proper layout structure', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(mockStateWithPetName));
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Container), findsAtLeastNWidgets(1));
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });
  });
}

class _TestCreateSubscriptionScreenNotifier extends CreateSubscriptionScreenNotifier {
  final CreateSubscriptionScreenState _mockState;

  _TestCreateSubscriptionScreenNotifier(this._mockState);

  @override
  CreateSubscriptionScreenState build() => _mockState;

  @override
  Future<void> loadProgress() async {}

  @override
  Future<void> saveProgress() async {}

  @override
  void updateBreed(DogBreed breed) {}

  @override
  void updatePetName(String name) {}

  @override
  void updatePetGender(String gender) {}

  @override
  void updatePetNeutered(bool neutered) {}

  @override
  void updatePetPregnantOrLactating(bool? pregnantOrLactating) {}

  @override
  void updatePetBirthDate(DateTime birthDate) {}

  @override
  void updatePetSilhouette(String silhouette) {}

  @override
  void updatePetWeight(double weight) {}

  @override
  void updateActivityLevel(String activityLevel) {}

  @override
  void updateHealthConditions(List<String> conditions) {}

  @override
  void updateFoodPreferences(String preferences) {}

  @override
  void updateOwnerEmail(String email) {}

  @override
  void updateOwnerPhone(String phone) {}

  @override
  void nextStep() {}

  @override
  void previousStep() {}

  @override
  void goToStep(int step) {}

  @override
  bool canGoNext() => true;

  @override
  bool canGoPrevious() => true;

  @override
  int get currentPageIndex => 0;

  @override
  Future<void> completeSubscription() async {}

  @override
  Future<void> clearProgress() async {}

  @override
  void clearError() {}
}
