import 'package:equatable/equatable.dart';

class DogBreed extends Equatable {
  final int id;
  final Map<String, String> name;

  const DogBreed({
    required this.id,
    required this.name,
  });

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      id: json['id'] as int,
      name: Map<String, String>.from(json['name'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  DogBreed copyWith({
    int? id,
    Map<String, String>? name,
  }) {
    return DogBreed(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  String getLocalizedName(String languageCode) {
    return name[languageCode] ?? name['en'] ?? name.values.first;
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
