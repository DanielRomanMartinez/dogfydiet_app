import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/delivery_form.dart';
import 'package:dogfydiet_app/domain/model/value_objects/geo_location_result.dart';
import 'package:dogfydiet_app/domain/model/value_objects/permission_status.dart';
import 'package:dogfydiet_app/domain/services/core/geo_location_service.dart';
import 'package:dogfydiet_app/domain/services/core/permissions_service.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pay_subscription_screen_notifier.g.dart';

@riverpod
class PaySubscriptionScreenNotifier extends _$PaySubscriptionScreenNotifier {
  @override
  PaySubscriptionState build() {
    return const PaySubscriptionState(
      form: DeliveryForm(
        country: '',
      ),
    );
  }

  GeolocationService get _geolocationService => ref.read(geolocationServiceProvider);
  PermissionService get _permissionService => ref.read(permissionServiceProvider);

  void initializeDefaultCountry(String defaultCountry) {
    if (state.form.country.isEmpty) {
      state = state.copyWith(
        form: state.form.copyWith(country: defaultCountry),
      );
    }
  }

  void updateName(String name) {
    state = state.copyWith(
      form: state.form.copyWith(name: name),
    );
  }

  void updateSurname(String surname) {
    state = state.copyWith(
      form: state.form.copyWith(surname: surname),
    );
  }

  void updateAddress(String address) {
    state = state.copyWith(
      form: state.form.copyWith(address: address),
    );
  }

  void updateLocality(String locality) {
    state = state.copyWith(
      form: state.form.copyWith(locality: locality),
    );
  }

  void updatePostalCode(String postalCode) {
    state = state.copyWith(
      form: state.form.copyWith(postalCode: postalCode),
    );
  }

  void updateCountry(String country) {
    state = state.copyWith(
      form: state.form.copyWith(country: country),
    );
  }

  void updateCardNumber(String cardNumber) {
    state = state.copyWith(
      form: state.form.copyWith(cardNumber: cardNumber),
    );
  }

  void updateSecurityCode(String securityCode) {
    state = state.copyWith(
      form: state.form.copyWith(securityCode: securityCode),
    );
  }

  void updatePaymentMethod(String paymentMethod) {
    state = state.copyWith(
      form: state.form.copyWith(paymentMethod: paymentMethod),
    );
  }

  void updateSelectedDate(DateTime date) {
    state = state.copyWith(
      form: state.form.copyWith(selectedDate: date),
    );
  }

  Future<LocationPermissionResult> requestLocationAndFillForm() async {
    state = state.copyWith(
      isLoadingLocation: true,
      locationError: null,
    );

    try {
      final permissionResult = await _checkAndRequestLocationPermission();
      if (permissionResult != LocationPermissionResult.granted) {
        state = state.copyWith(isLoadingLocation: false);
        return permissionResult;
      }

      final serviceEnabled = await _geolocationService.isLocationServiceAvailable();
      if (!serviceEnabled) {
        state = state.copyWith(
          isLoadingLocation: false,
          locationError: 'locationServiceDisabled',
        );
        return LocationPermissionResult.serviceDisabled;
      }

      final locationResponse = await _geolocationService.getCurrentLocation();

      switch (locationResponse.result) {
        case GeolocationResult.success:
          if (locationResponse.location != null) {
            final locationData = locationResponse.location!;

            final countryValue = locationData.country ?? state.form.country;

            state = state.copyWith(
              isLoadingLocation: false,
              form: state.form.copyWith(
                address: locationData.address ?? state.form.address,
                locality: locationData.locality ?? state.form.locality,
                postalCode: locationData.postalCode ?? state.form.postalCode,
                country: countryValue,
              ),
            );
          }
          break;
        case GeolocationResult.permissionDenied:
          state = state.copyWith(
            isLoadingLocation: false,
            locationError: 'locationPermissionDenied',
          );
          break;
        case GeolocationResult.serviceDisabled:
          state = state.copyWith(
            isLoadingLocation: false,
            locationError: 'locationServiceDisabled',
          );
          break;
        case GeolocationResult.timeout:
        case GeolocationResult.error:
          state = state.copyWith(
            isLoadingLocation: false,
            locationError: 'locationDetectionFailed',
          );
          break;
      }

      return LocationPermissionResult.granted;
    } catch (e) {
      state = state.copyWith(
        isLoadingLocation: false,
        locationError: 'locationDetectionFailed',
      );
      return LocationPermissionResult.error;
    }
  }

  Future<LocationPermissionResult> _checkAndRequestLocationPermission() async {
    final currentStatus = await _permissionService.checkLocationPermission();

    switch (currentStatus) {
      case PermissionStatus.granted:
        return LocationPermissionResult.granted;
      case PermissionStatus.denied:
        final requestResult = await _permissionService.requestLocationPermission();
        switch (requestResult) {
          case PermissionStatus.granted:
            return LocationPermissionResult.granted;
          case PermissionStatus.permanentlyDenied:
            return LocationPermissionResult.permanentlyDenied;
          default:
            return LocationPermissionResult.denied;
        }
      case PermissionStatus.permanentlyDenied:
        return LocationPermissionResult.permanentlyDenied;
      case PermissionStatus.restricted:
        return LocationPermissionResult.denied;
    }
  }

  Future<bool> openAppSettings() async {
    return await _permissionService.openAppSettings();
  }

  Future<bool> requestLocationService() async {
    return await _permissionService.requestLocationService();
  }

  void clearLocationError() {
    state = state.copyWith(locationError: null);
  }

  Future<bool> processPayment() async {
    state = state.copyWith(
      isProcessingPayment: true,
      paymentError: null,
    );

    try {
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isProcessingPayment: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isProcessingPayment: false,
        paymentError: 'Payment failed',
      );
      return false;
    }
  }
}

enum LocationPermissionResult {
  granted,
  denied,
  permanentlyDenied,
  serviceDisabled,
  error,
}

class PaySubscriptionState extends Equatable {
  final DeliveryForm form;
  final bool isLoadingLocation;
  final bool isProcessingPayment;
  final String? locationError;
  final String? paymentError;

  const PaySubscriptionState({
    this.form = const DeliveryForm(),
    this.isLoadingLocation = false,
    this.isProcessingPayment = false,
    this.locationError,
    this.paymentError,
  });

  PaySubscriptionState copyWith({
    DeliveryForm? form,
    bool? isLoadingLocation,
    bool? isProcessingPayment,
    String? locationError,
    String? paymentError,
  }) {
    return PaySubscriptionState(
      form: form ?? this.form,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      isProcessingPayment: isProcessingPayment ?? this.isProcessingPayment,
      locationError: locationError,
      paymentError: paymentError,
    );
  }

  @override
  List<Object?> get props => [
    form,
    isLoadingLocation,
    isProcessingPayment,
    locationError,
    paymentError,
  ];
}