import 'package:dogfydiet_app/domain/model/value_objects/permission_status.dart';
import 'package:dogfydiet_app/domain/services/core/permissions_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class PermissionServiceImpl implements PermissionService {
  @override
  Future<PermissionStatus> checkLocationPermission() async {
    final status = await ph.Permission.location.status;
    return _mapPermissionStatus(status);
  }

  @override
  Future<PermissionStatus> requestLocationPermission() async {
    final status = await ph.Permission.location.request();
    return _mapPermissionStatus(status);
  }

  @override
  Future<bool> openAppSettings() async {
    return await ph.openAppSettings();
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> requestLocationService() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        final permission = await Geolocator.requestPermission();
        return permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  PermissionStatus _mapPermissionStatus(ph.PermissionStatus status) {
    switch (status) {
      case ph.PermissionStatus.granted:
      case ph.PermissionStatus.limited:
      case ph.PermissionStatus.provisional:
        return PermissionStatus.granted;
      case ph.PermissionStatus.denied:
        return PermissionStatus.denied;
      case ph.PermissionStatus.permanentlyDenied:
        return PermissionStatus.permanentlyDenied;
      case ph.PermissionStatus.restricted:
        return PermissionStatus.restricted;
    }
  }
}