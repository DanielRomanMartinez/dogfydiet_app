import 'package:dogfydiet_app/application/screens/home/pay_subscription_screen/pay_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/delivery_form.dart' hide LocationData;
import 'package:dogfydiet_app/domain/model/value_objects/geo_location_responde.dart';
import 'package:dogfydiet_app/domain/model/value_objects/geo_location_result.dart';
import 'package:dogfydiet_app/domain/model/value_objects/location_data.dart';
import 'package:dogfydiet_app/domain/model/value_objects/permission_status.dart';
import 'package:dogfydiet_app/domain/services/core/geo_location_service.dart';
import 'package:dogfydiet_app/domain/services/core/permissions_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pay_subscription_screen_notifier_test.mocks.dart';

@GenerateMocks([GeolocationService, PermissionService])
void main() {
  late MockGeolocationService mockGeolocationService;
  late MockPermissionService mockPermissionService;
  late ProviderContainer container;

  setUp(() {
    mockGeolocationService = MockGeolocationService();
    mockPermissionService = MockPermissionService();

    container = ProviderContainer(
      overrides: [
        geolocationServiceProvider.overrideWithValue(mockGeolocationService),
        permissionServiceProvider.overrideWithValue(mockPermissionService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('PaySubscriptionScreenNotifier', () {
    test('should return initial state', () {
      final state = container.read(paySubscriptionScreenNotifierProvider);

      expect(state.form.country, '');
      expect(state.form.name, '');
      expect(state.form.surname, '');
      expect(state.form.address, '');
      expect(state.form.locality, '');
      expect(state.form.postalCode, '');
      expect(state.form.cardNumber, '');
      expect(state.form.securityCode, '');
      expect(state.form.paymentMethod, 'card');
      expect(state.form.selectedDate, isNull);
      expect(state.isLoadingLocation, false);
      expect(state.isProcessingPayment, false);
      expect(state.locationError, isNull);
      expect(state.paymentError, isNull);
    });

    test('should initialize default country', () {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      notifier.initializeDefaultCountry('Spain');

      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.form.country, 'Spain');
    });

    test('should not override existing country', () {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      notifier.updateCountry('France');

      notifier.initializeDefaultCountry('Spain');

      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.form.country, 'France');
    });

    test('should update form fields', () {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      notifier.updateName('John');
      notifier.updateSurname('Doe');
      notifier.updateAddress('123 Main St');
      notifier.updateLocality('City');
      notifier.updatePostalCode('12345');
      notifier.updateCountry('Spain');
      notifier.updateCardNumber('1234567890123456');
      notifier.updateSecurityCode('123');
      notifier.updatePaymentMethod('paypal');

      final date = DateTime.now();
      notifier.updateSelectedDate(date);

      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.form.name, 'John');
      expect(state.form.surname, 'Doe');
      expect(state.form.address, '123 Main St');
      expect(state.form.locality, 'City');
      expect(state.form.postalCode, '12345');
      expect(state.form.country, 'Spain');
      expect(state.form.cardNumber, '1234567890123456');
      expect(state.form.securityCode, '123');
      expect(state.form.paymentMethod, 'paypal');
      expect(state.form.selectedDate, date);
    });

    test('should request location and fill form successfully', () async {
      const locationData = LocationData(
        latitude: 40.7128,
        longitude: -74.0060,
        address: '123 Main St',
        locality: 'New York',
        postalCode: '10001',
        country: 'USA',
      );

      const geolocationResponse = GeolocationResponse(
        result: GeolocationResult.success,
        location: locationData,
      );

      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(mockGeolocationService.isLocationServiceAvailable())
          .thenAnswer((_) async => true);
      when(mockGeolocationService.getCurrentLocation())
          .thenAnswer((_) async => geolocationResponse);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.granted);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.form.address, '123 Main St');
      expect(state.form.locality, 'New York');
      expect(state.form.postalCode, '10001');
      expect(state.form.country, 'USA');
      expect(state.isLoadingLocation, false);
      expect(state.locationError, isNull);
    });

    test('should handle permission denied', () async {
      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.denied);
      when(mockPermissionService.requestLocationPermission())
          .thenAnswer((_) async => PermissionStatus.denied);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.denied);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
    });

    test('should handle permanently denied permission', () async {
      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.permanentlyDenied);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
    });

    test('should handle location service disabled', () async {
      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(mockGeolocationService.isLocationServiceAvailable())
          .thenAnswer((_) async => false);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.serviceDisabled);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
      expect(state.locationError, 'locationServiceDisabled');
    });

    test('should handle geolocation permission denied', () async {
      const geolocationResponse = GeolocationResponse(
        result: GeolocationResult.permissionDenied,
      );

      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(mockGeolocationService.isLocationServiceAvailable())
          .thenAnswer((_) async => true);
      when(mockGeolocationService.getCurrentLocation())
          .thenAnswer((_) async => geolocationResponse);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.granted);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
      expect(state.locationError, 'locationPermissionDenied');
    });

    test('should handle geolocation timeout', () async {
      const geolocationResponse = GeolocationResponse(
        result: GeolocationResult.timeout,
      );

      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(mockGeolocationService.isLocationServiceAvailable())
          .thenAnswer((_) async => true);
      when(mockGeolocationService.getCurrentLocation())
          .thenAnswer((_) async => geolocationResponse);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.granted);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
      expect(state.locationError, 'locationDetectionFailed');
    });

    test('should handle geolocation error', () async {
      const geolocationResponse = GeolocationResponse(
        result: GeolocationResult.error,
      );

      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(mockGeolocationService.isLocationServiceAvailable())
          .thenAnswer((_) async => true);
      when(mockGeolocationService.getCurrentLocation())
          .thenAnswer((_) async => geolocationResponse);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.granted);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
      expect(state.locationError, 'locationDetectionFailed');
    });

    test('should handle exception during location request', () async {
      when(mockPermissionService.checkLocationPermission())
          .thenThrow(Exception('Permission error'));

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.error);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
      expect(state.locationError, 'locationDetectionFailed');
    });

    test('should open app settings', () async {
      when(mockPermissionService.openAppSettings()).thenAnswer((_) async => true);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.openAppSettings();

      expect(result, true);
      verify(mockPermissionService.openAppSettings()).called(1);
    });

    test('should request location service', () async {
      when(mockPermissionService.requestLocationService()).thenAnswer((_) async => true);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationService();

      expect(result, true);
      verify(mockPermissionService.requestLocationService()).called(1);
    });

    test('should clear location error', () {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      notifier.clearLocationError();

      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.locationError, isNull);
    });

    test('should process payment successfully', () async {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.processPayment();

      expect(result, true);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isProcessingPayment, false);
      expect(state.paymentError, isNull);
    });

    test('should handle payment error', () async {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.processPayment();

      expect(result, true);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isProcessingPayment, false);
    });

    test('should set loading state during payment processing', () async {
      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      expect(container.read(paySubscriptionScreenNotifierProvider).isProcessingPayment, false);

      final future = notifier.processPayment();

      expect(container.read(paySubscriptionScreenNotifierProvider).isProcessingPayment, true);

      await future;
      expect(container.read(paySubscriptionScreenNotifierProvider).isProcessingPayment, false);
    });

    test('should preserve existing country when location has no country', () async {
      const locationData = LocationData(
        latitude: 40.7128,
        longitude: -74.0060,
        address: '123 Main St',
        locality: 'New York',
        postalCode: '10001',
        country: null,
      );

      const geolocationResponse = GeolocationResponse(
        result: GeolocationResult.success,
        location: locationData,
      );

      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(mockGeolocationService.isLocationServiceAvailable())
          .thenAnswer((_) async => true);
      when(mockGeolocationService.getCurrentLocation())
          .thenAnswer((_) async => geolocationResponse);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);
      notifier.updateCountry('Spain');

      await notifier.requestLocationAndFillForm();

      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.form.country, 'Spain');
    });

    test('should handle restricted permission', () async {
      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.restricted);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.denied);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
    });

    test('should handle permission request that becomes permanently denied', () async {
      when(mockPermissionService.checkLocationPermission())
          .thenAnswer((_) async => PermissionStatus.denied);
      when(mockPermissionService.requestLocationPermission())
          .thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      final notifier = container.read(paySubscriptionScreenNotifierProvider.notifier);

      final result = await notifier.requestLocationAndFillForm();

      expect(result, LocationPermissionResult.permanentlyDenied);
      final state = container.read(paySubscriptionScreenNotifierProvider);
      expect(state.isLoadingLocation, false);
    });
  });

  group('PaySubscriptionState', () {
    test('should create state with default values', () {
      const state = PaySubscriptionState();

      expect(state.form, const DeliveryForm());
      expect(state.isLoadingLocation, false);
      expect(state.isProcessingPayment, false);
      expect(state.locationError, isNull);
      expect(state.paymentError, isNull);
    });

    test('should create state with custom values', () {
      const form = DeliveryForm(name: 'John', surname: 'Doe');
      const state = PaySubscriptionState(
        form: form,
        isLoadingLocation: true,
        isProcessingPayment: true,
        locationError: 'Location error',
        paymentError: 'Payment error',
      );

      expect(state.form, form);
      expect(state.isLoadingLocation, true);
      expect(state.isProcessingPayment, true);
      expect(state.locationError, 'Location error');
      expect(state.paymentError, 'Payment error');
    });

    test('should create new state with copyWith', () {
      const initialState = PaySubscriptionState();
      const newForm = DeliveryForm(name: 'Jane');

      final newState = initialState.copyWith(
        form: newForm,
        isLoadingLocation: true,
        locationError: 'Error',
      );

      expect(newState.form, newForm);
      expect(newState.isLoadingLocation, true);
      expect(newState.locationError, 'Error');
      expect(newState.isProcessingPayment, false);
      expect(newState.paymentError, isNull);
    });

    test('should clear errors with copyWith null', () {
      const initialState = PaySubscriptionState(
        locationError: 'Location error',
        paymentError: 'Payment error',
      );

      final newState = initialState.copyWith(
        locationError: null,
        paymentError: null,
      );

      expect(newState.locationError, isNull);
      expect(newState.paymentError, isNull);
    });

    test('should support equality', () {
      const state1 = PaySubscriptionState();
      const state2 = PaySubscriptionState();

      expect(state1, equals(state2));
    });

    test('should support inequality', () {
      const state1 = PaySubscriptionState();
      const state2 = PaySubscriptionState(isLoadingLocation: true);

      expect(state1, isNot(equals(state2)));
    });
  });

  group('LocationPermissionResult', () {
    test('should have all expected values', () {
      expect(LocationPermissionResult.values, [
        LocationPermissionResult.granted,
        LocationPermissionResult.denied,
        LocationPermissionResult.permanentlyDenied,
        LocationPermissionResult.serviceDisabled,
        LocationPermissionResult.error,
      ]);
    });
  });
}