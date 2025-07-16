import 'dart:async';

import 'package:dogfydiet_app/domain/model/value_objects/geo_location_responde.dart';
import 'package:dogfydiet_app/domain/model/value_objects/geo_location_result.dart';
import 'package:dogfydiet_app/domain/model/value_objects/location_data.dart';
import 'package:dogfydiet_app/domain/services/core/geo_location_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceImpl implements GeolocationService {
  static const Duration _timeoutDuration = Duration(seconds: 10);

  String? _normalizeCountry(String? country) {
    if (country == null || country.isEmpty) return null;

    return country.trim();
  }

  @override
  Future<GeolocationResponse> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const GeolocationResponse(
          result: GeolocationResult.serviceDisabled,
        );
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const GeolocationResponse(
            result: GeolocationResult.permissionDenied,
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const GeolocationResponse(
          result: GeolocationResult.permissionDenied,
        );
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          timeLimit: _timeoutDuration,
        ),
      );
      LocationData? addressData = await getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final locationData = LocationData(
        latitude: position.latitude,
        longitude: position.longitude,
        address: addressData?.address,
        locality: addressData?.locality,
        postalCode: addressData?.postalCode,
        country: addressData?.country,
      );

      return GeolocationResponse(
        result: GeolocationResult.success,
        location: locationData,
      );
    } on TimeoutException {
      return const GeolocationResponse(
        result: GeolocationResult.timeout,
      );
    } catch (e) {
      return GeolocationResponse(
        result: GeolocationResult.error,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<LocationData?> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;

        String address = _buildAddressString(placemark);

        return LocationData(
          latitude: latitude,
          longitude: longitude,
          address: address.isNotEmpty ? address : null,
          locality: _extractLocality(placemark),
          postalCode: placemark.postalCode?.trim(),
          country: _normalizeCountry(placemark.country),
        );
      }
      return null;
    } catch (e) {
      return LocationData(
        latitude: latitude,
        longitude: longitude,
      );
    }
  }

  String _buildAddressString(Placemark placemark) {
    final parts = <String>[];

    if (placemark.subThoroughfare?.isNotEmpty == true) {
      parts.add(placemark.subThoroughfare!.trim());
    }

    if (placemark.street?.isNotEmpty == true) {
      parts.add(placemark.street!.trim());
    } else if (placemark.thoroughfare?.isNotEmpty == true) {
      parts.add(placemark.thoroughfare!.trim());
    }

    return parts.join(' ').trim();
  }

  String? _extractLocality(Placemark placemark) {
    final localityOptions = [
      placemark.locality,
      placemark.subAdministrativeArea,
      placemark.administrativeArea,
      placemark.subLocality,
    ];

    for (final option in localityOptions) {
      if (option?.isNotEmpty == true) {
        return option!.trim();
      }
    }

    return null;
  }

  @override
  Future<bool> isLocationServiceAvailable() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
