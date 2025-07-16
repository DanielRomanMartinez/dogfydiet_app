import 'package:dogfydiet_app/domain/model/value_objects/geo_location_result.dart';
import 'package:dogfydiet_app/domain/model/value_objects/location_data.dart';

class GeolocationResponse {
  final GeolocationResult result;
  final LocationData? location;
  final String? errorMessage;

  const GeolocationResponse({
    required this.result,
    this.location,
    this.errorMessage,
  });

  bool get isSuccess => result == GeolocationResult.success;
}
