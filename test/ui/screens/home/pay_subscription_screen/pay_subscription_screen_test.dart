import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/application/screens/home/pay_subscription_screen/pay_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/delivery_form.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';
import 'package:dogfydiet_app/ui/screens/home/pay_subscription_screen/pay_subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/create_test_widget_with_localizations.dart';

const mockBreed = DogBreed(
  id: 1,
  name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'},
);

final mockSubscriptionForm = SubscriptionForm(
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

final mockSubscriptionState = CreateSubscriptionScreenState(
  form: mockSubscriptionForm,
  isLoading: false,
  error: null,
  isSubmitting: false,
);

final mockDeliveryForm = DeliveryForm(
  name: 'John',
  surname: 'Doe',
  address: 'Test Address 123',
  locality: 'Test City',
  postalCode: '12345',
  country: 'Spain',
  cardNumber: '1234567890123456',
  securityCode: '123',
  paymentMethod: 'card',
  selectedDate: DateTime.now().add(const Duration(days: 1)),
);

final mockPaySubscriptionState = PaySubscriptionState(
  form: mockDeliveryForm,
  isLoadingLocation: false,
  isProcessingPayment: false,
  locationError: null,
  paymentError: null,
);

void main() {
  group('PaySubscriptionScreen Tests', () {

    Widget createTestWidget({
      CreateSubscriptionScreenState? subscriptionState,
      PaySubscriptionState? payState,
    }) {
      return ProviderScope(
        overrides: [
          createSubscriptionScreenNotifierProvider.overrideWith(
                () => _TestCreateSubscriptionScreenNotifier(
              subscriptionState ?? mockSubscriptionState,
            ),
          ),
          paySubscriptionScreenNotifierProvider.overrideWith(
                () => _TestPaySubscriptionScreenNotifier(
              payState ?? mockPaySubscriptionState,
            ),
          ),
        ],
        child: createTestWidgetWithLocalizations(
          child: const PaySubscriptionScreen(),
        ),
      );
    }

    testWidgets('should render screen without errors', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(PaySubscriptionScreen), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display main title with pet name', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining('Max'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display main title without pet name', (WidgetTester tester) async {
      final stateWithoutPetName = CreateSubscriptionScreenState(
        form: mockSubscriptionForm.copyWith(petName: null),
        isLoading: false,
        error: null,
        isSubmitting: false,
      );

      await tester.pumpWidget(createTestWidget(subscriptionState: stateWithoutPetName));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display date picker field', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
    });

    testWidgets('should display order summary', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining('200 g'), findsAtLeastNWidgets(1));
      expect(find.textContaining('-30%'), findsAtLeastNWidgets(1));
      expect(find.textContaining('🎉'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display delivery form fields', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Locality / City'), findsOneWidget);
      expect(find.text('Postal code'), findsOneWidget);
      expect(find.text('Country'), findsOneWidget);
    });

    testWidgets('should display location button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.location_on), findsOneWidget);
      expect(find.byIcon(Icons.my_location), findsOneWidget);
      expect(find.text('Use current location'), findsOneWidget);
    });

    testWidgets('should display payment method selector', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.credit_card), findsOneWidget);
      expect(find.text('Card'), findsOneWidget);
      expect(find.text('VISA'), findsOneWidget);
      expect(find.text('MC'), findsOneWidget);
      expect(find.text('AE'), findsOneWidget);
    });

    testWidgets('should display card fields when card is selected', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Card number'), findsOneWidget);
      expect(find.text('Security code'), findsOneWidget);
      expect(find.textContaining('123'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display finalize payment button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final finalizeButton = find.text('Complete Dogfy Diet');
      expect(finalizeButton, findsOneWidget);
    });

    testWidgets('should handle finalize payment button tap', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final finalizeButton = find.text('Complete Dogfy Diet');
      await tester.ensureVisible(finalizeButton);
      await tester.tap(finalizeButton, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display loading state in location button', (WidgetTester tester) async {
      final loadingState = PaySubscriptionState(
        form: mockDeliveryForm,
        isLoadingLocation: true,
        isProcessingPayment: false,
      );

      await tester.pumpWidget(createTestWidget(payState: loadingState));
      await tester.pump();

      await tester.pump(Duration.zero);

      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      expect(find.text('Detecting location...'), findsOneWidget);
    });

    testWidgets('should display loading state in payment button', (WidgetTester tester) async {
      final processingState = PaySubscriptionState(
        form: mockDeliveryForm,
        isLoadingLocation: false,
        isProcessingPayment: true,
      );

      await tester.pumpWidget(createTestWidget(payState: processingState));
      await tester.pump();

      await tester.pump(Duration.zero);

      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
    });

    testWidgets('should display location error', (WidgetTester tester) async {
      final errorState = PaySubscriptionState(
        form: mockDeliveryForm,
        isLoadingLocation: false,
        isProcessingPayment: false,
        locationError: 'locationPermissionDenied',
      );

      await tester.pumpWidget(createTestWidget(payState: errorState));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      expect(find.text('Try again'), findsOneWidget);
    });

    testWidgets('should be scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
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

    testWidgets('should display all text fields', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final textFields = find.byType(TextField);
      expect(textFields, findsAtLeastNWidgets(7));
    });

    testWidgets('should display order items', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('🍗'), findsOneWidget);
      expect(find.text('🦃'), findsOneWidget);
      expect(find.text('🐟'), findsOneWidget);
      expect(find.text('🥩'), findsOneWidget);
      expect(find.text('🎁'), findsOneWidget);
    });

    testWidgets('should display order benefits', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Free shipping'), findsOneWidget);
      expect(find.text('Secure payment'), findsOneWidget);
      expect(find.text('Flexibility'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsAtLeastNWidgets(3));
    });

    testWidgets('should display promo code button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining('promotional code'), findsOneWidget);
    });

    testWidgets('should display GLS shipping info', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('GLS'), findsOneWidget);
      expect(find.byIcon(Icons.local_shipping), findsOneWidget);
    });

    testWidgets('should handle text field interactions', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final nameField = find.byWidgetPredicate(
            (widget) => widget is TextField &&
            widget.decoration?.hintText == 'My name is...',
      );
      expect(nameField, findsOneWidget);

      await tester.enterText(nameField, 'Test Name');
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display radio button for payment method', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Radio<String>), findsOneWidget);
    });

    testWidgets('should display date picker with edit button', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final editButton = find.ancestor(
        of: find.text('Edit'),
        matching: find.byType(TextButton),
      );
      expect(editButton, findsOneWidget);
    });

    testWidgets('should handle location button tap', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final locationButton = find.text('Use current location');
      await tester.ensureVisible(locationButton);
      await tester.tap(locationButton, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should display proper layout structure', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Container), findsAtLeastNWidgets(1));
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));
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

class _TestPaySubscriptionScreenNotifier extends PaySubscriptionScreenNotifier {
  final PaySubscriptionState _mockState;

  _TestPaySubscriptionScreenNotifier(this._mockState);

  @override
  PaySubscriptionState build() => _mockState;

  @override
  void initializeDefaultCountry(String defaultCountry) {}

  @override
  void updateName(String name) {}

  @override
  void updateSurname(String surname) {}

  @override
  void updateAddress(String address) {}

  @override
  void updateLocality(String locality) {}

  @override
  void updatePostalCode(String postalCode) {}

  @override
  void updateCountry(String country) {}

  @override
  void updateCardNumber(String cardNumber) {}

  @override
  void updateSecurityCode(String securityCode) {}

  @override
  void updatePaymentMethod(String paymentMethod) {}

  @override
  void updateSelectedDate(DateTime date) {}

  @override
  Future<LocationPermissionResult> requestLocationAndFillForm() async {
    return LocationPermissionResult.granted;
  }

  @override
  Future<bool> openAppSettings() async => true;

  @override
  Future<bool> requestLocationService() async => true;

  @override
  void clearLocationError() {}

  @override
  Future<bool> processPayment() async => true;
}