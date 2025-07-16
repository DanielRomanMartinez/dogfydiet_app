import 'package:dogfydiet_app/domain/model/value_objects/permission_status.dart';

abstract class PermissionService {
  Future<PermissionStatus> checkLocationPermission();

  Future<PermissionStatus> requestLocationPermission();

  Future<bool> openAppSettings();

  Future<bool> isLocationServiceEnabled();

  Future<bool> requestLocationService();
}
