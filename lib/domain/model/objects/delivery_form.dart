import 'package:equatable/equatable.dart';

class DeliveryForm extends Equatable {
  final String name;
  final String surname;
  final String address;
  final String locality;
  final String postalCode;
  final String country;
  final String cardNumber;
  final String securityCode;
  final String paymentMethod;
  final DateTime? selectedDate;
  final String? petName;

  const DeliveryForm({
    this.name = '',
    this.surname = '',
    this.address = '',
    this.locality = '',
    this.postalCode = '',
    this.country = 'ES',
    this.cardNumber = '',
    this.securityCode = '',
    this.paymentMethod = 'card',
    this.selectedDate,
    this.petName,
  });

  DeliveryForm copyWith({
    String? name,
    String? surname,
    String? address,
    String? locality,
    String? postalCode,
    String? country,
    String? cardNumber,
    String? securityCode,
    String? paymentMethod,
    DateTime? selectedDate,
    String? petName,
  }) {
    return DeliveryForm(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      address: address ?? this.address,
      locality: locality ?? this.locality,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      cardNumber: cardNumber ?? this.cardNumber,
      securityCode: securityCode ?? this.securityCode,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      selectedDate: selectedDate ?? this.selectedDate,
      petName: petName ?? this.petName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'address': address,
      'locality': locality,
      'postalCode': postalCode,
      'country': country,
      'cardNumber': cardNumber,
      'securityCode': securityCode,
      'paymentMethod': paymentMethod,
      'selectedDate': selectedDate?.toIso8601String(),
      'petName': petName,
    };
  }

  factory DeliveryForm.fromJson(Map<String, dynamic> json) {
    return DeliveryForm(
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      address: json['address'] ?? '',
      locality: json['locality'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      securityCode: json['securityCode'] ?? '',
      paymentMethod: json['paymentMethod'] ?? 'card',
      selectedDate: json['selectedDate'] != null ? DateTime.parse(json['selectedDate']) : null,
      petName: json['petName'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        surname,
        address,
        locality,
        postalCode,
        country,
        cardNumber,
        securityCode,
        paymentMethod,
        selectedDate,
        petName,
      ];
}

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
