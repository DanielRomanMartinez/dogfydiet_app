import 'package:equatable/equatable.dart';

class LocationData extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;
  final String? locality;
  final String? postalCode;
  final String? country;

  const LocationData({
    required this.latitude,
    required this.longitude,
    this.address,
    this.locality,
    this.postalCode,
    this.country,
  });

  LocationData copyWith({
    double? latitude,
    double? longitude,
    String? address,
    String? locality,
    String? postalCode,
    String? country,
  }) {
    return LocationData(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      locality: locality ?? this.locality,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'locality': locality,
      'postalCode': postalCode,
      'country': country,
    };
  }

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      address: json['address'],
      locality: json['locality'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
        locality,
        postalCode,
        country,
      ];
}
