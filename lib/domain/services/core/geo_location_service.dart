import 'package:dogfydiet_app/domain/model/value_objects/geo_location_responde.dart';
import 'package:dogfydiet_app/domain/model/value_objects/location_data.dart';

abstract class GeolocationService {
  Future<GeolocationResponse> getCurrentLocation();

  Future<LocationData?> getAddressFromCoordinates(
    double latitude,
    double longitude,
  );

  Future<bool> isLocationServiceAvailable();
}
