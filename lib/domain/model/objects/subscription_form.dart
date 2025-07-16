import 'package:equatable/equatable.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';

class SubscriptionForm extends Equatable {
  final DogBreed? selectedBreed;
  final String? petName;
  final String? petGender; // 'male' | 'female' // TODO: Enum
  final bool? petNeutered;
  final bool? petPregnantOrLactating;
  final DateTime? petBirthDate;
  final String? petSilhouette; // For adults: 'thin' | 'normal' | 'overweight'
  final double? petWeight;
  final String? activityLevel; // 'low' | 'medium' | 'high' // TODO: Enum
  final List<String>? healthConditions;
  final String? foodPreferences; // 'gourmet' | 'simple' | 'adventurous' // TODO: Enum
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? address;
  final int currentStep;
  final bool isCompleted;

  const SubscriptionForm({
    this.selectedBreed,
    this.petName,
    this.petGender,
    this.petNeutered,
    this.petPregnantOrLactating,
    this.petBirthDate,
    this.petSilhouette,
    this.petWeight,
    this.activityLevel,
    this.healthConditions,
    this.foodPreferences,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
    this.address,
    this.currentStep = 0,
    this.isCompleted = false,
  });

  factory SubscriptionForm.fromJson(Map<String, dynamic> json) {
    return SubscriptionForm(
      selectedBreed:
          json['selectedBreed'] != null ? DogBreed.fromJson(json['selectedBreed'] as Map<String, dynamic>) : null,
      petName: json['petName'] as String?,
      petGender: json['petGender'] as String?,
      petNeutered: json['petNeutered'] as bool?,
      petPregnantOrLactating: json['petPregnantOrLactating'] as bool?,
      petBirthDate: json['petBirthDate'] != null ? DateTime.parse(json['petBirthDate'] as String) : null,
      petSilhouette: json['petSilhouette'] as String?,
      petWeight: json['petWeight'] as double?,
      activityLevel: json['activityLevel'] as String?,
      healthConditions: json['healthConditions'] != null ? List<String>.from(json['healthConditions'] as List) : null,
      foodPreferences: json['foodPreferences'] as String?,
      ownerName: json['ownerName'] as String?,
      ownerEmail: json['ownerEmail'] as String?,
      ownerPhone: json['ownerPhone'] as String?,
      address: json['address'] as String?,
      currentStep: json['currentStep'] as int? ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedBreed': selectedBreed?.toJson(),
      'petName': petName,
      'petGender': petGender,
      'petNeutered': petNeutered,
      'petPregnantOrLactating': petPregnantOrLactating,
      'petBirthDate': petBirthDate?.toIso8601String(),
      'petSilhouette': petSilhouette,
      'petWeight': petWeight,
      'activityLevel': activityLevel,
      'healthConditions': healthConditions,
      'foodPreferences': foodPreferences,
      'ownerName': ownerName,
      'ownerEmail': ownerEmail,
      'ownerPhone': ownerPhone,
      'address': address,
      'currentStep': currentStep,
      'isCompleted': isCompleted,
    };
  }

  SubscriptionForm copyWith({
    DogBreed? selectedBreed,
    String? petName,
    String? petGender,
    bool? petNeutered,
    bool? petPregnantOrLactating,
    DateTime? petBirthDate,
    String? petSilhouette,
    double? petWeight,
    String? activityLevel,
    List<String>? healthConditions,
    String? foodPreferences,
    String? ownerName,
    String? ownerEmail,
    String? ownerPhone,
    String? address,
    int? currentStep,
    bool? isCompleted,
  }) {
    return SubscriptionForm(
      selectedBreed: selectedBreed ?? this.selectedBreed,
      petName: petName ?? this.petName,
      petGender: petGender ?? this.petGender,
      petNeutered: petNeutered ?? this.petNeutered,
      petPregnantOrLactating: petPregnantOrLactating ?? this.petPregnantOrLactating,
      petBirthDate: petBirthDate ?? this.petBirthDate,
      petSilhouette: petSilhouette ?? this.petSilhouette,
      petWeight: petWeight ?? this.petWeight,
      activityLevel: activityLevel ?? this.activityLevel,
      healthConditions: healthConditions ?? this.healthConditions,
      foodPreferences: foodPreferences ?? this.foodPreferences,
      ownerName: ownerName ?? this.ownerName,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      address: address ?? this.address,
      currentStep: currentStep ?? this.currentStep,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  static const int stepBreedSelection = 0;
  static const int stepPetName = 1;
  static const int stepPetGender = 2;
  static const int stepBirthDate = 3;
  static const int stepAdultWeightSilhouette = 4;
  static const int stepPuppyWeight = 5;
  static const int stepActivityLevel = 6;
  static const int stepHealthConditions = 7;
  static const int stepFoodPreferences = 8;
  static const int stepOwnerDetails = 9;

  bool get isPuppy {
    if (petBirthDate == null) return false;
    final now = DateTime.now();
    final age = now.difference(petBirthDate!);
    return age.inDays < 365;
  }

  List<int> get enabledSteps {
    final steps = <int>[
      stepBreedSelection,
      stepPetName,
      stepPetGender,
      stepBirthDate,
    ];

    if (isPuppy) {
      steps.add(stepPuppyWeight);
    } else {
      steps.add(stepAdultWeightSilhouette);
    }

    steps.addAll([
      stepActivityLevel,
      stepHealthConditions,
      stepFoodPreferences,
      stepOwnerDetails,
    ]);

    return steps;
  }

  int get currentStepIndex {
    final enabled = enabledSteps;
    final index = enabled.indexOf(currentStep);
    return index >= 0 ? index : 0;
  }

  int get totalSteps => enabledSteps.length;

  double get progress => totalSteps > 0 ? (currentStepIndex + 1) / totalSteps : 0.0;

  int? get nextStepIndex {
    final enabled = enabledSteps;
    final currentIndex = enabled.indexOf(currentStep);
    if (currentIndex >= 0 && currentIndex < enabled.length - 1) {
      return enabled[currentIndex + 1];
    }
    return null;
  }

  int? get previousStepIndex {
    final enabled = enabledSteps;
    final currentIndex = enabled.indexOf(currentStep);
    if (currentIndex > 0) {
      return enabled[currentIndex - 1];
    }
    return null;
  }

  bool isCurrentStepValid() {
    switch (currentStep) {
      case stepBreedSelection:
        return selectedBreed != null;
      case stepPetName:
        return petName != null && petName!.isNotEmpty;
      case stepPetGender:
        return petGender != null && petNeutered != null;
      case stepBirthDate:
        return petBirthDate != null;
      case stepAdultWeightSilhouette:
        return petSilhouette != null && petWeight != null && petWeight! > 0;
      case stepPuppyWeight:
        return petWeight != null && petWeight! > 0;
      case stepActivityLevel:
        return activityLevel != null;
      case stepHealthConditions:
        return true;
      case stepFoodPreferences:
        return foodPreferences != null;
      case stepOwnerDetails:
        return _isValidEmail(ownerEmail) && _isValidPhone(ownerPhone);
      default:
        return false;
    }
  }

  bool get isCurrentStepEnabled {
    return enabledSteps.contains(currentStep);
  }

  bool get showPregnantOrLactatingOption => petGender == 'female' && petNeutered == false;

  String getStepTitle() {
    switch (currentStep) {
      case stepAdultWeightSilhouette:
        return '¿Qué silueta representa mejor a ${petName ?? 'tu perro'}?';
      case stepPuppyWeight:
        return '¡${petName ?? 'Tu perro'} es un cachorro! 🥰';
      case stepActivityLevel:
        return '¿Cuál es el nivel de actividad de ${petName ?? 'tu perro'}? 🏃‍♀️';
      default:
        return '';
    }
  }

  String getStepDescription() {
    switch (currentStep) {
      case stepAdultWeightSilhouette:
        return 'Selecciona la figura que más se asemeja en cuanto a su peso y forma 🐕';
      case stepPuppyWeight:
        return 'Es importante saber su peso actual para calcular su ración ideal.';
      case stepActivityLevel:
        return 'Elige el nivel de actividad que mejor le describe.';
      default:
        return '';
    }
  }

  bool _isValidEmail(String? email) {
    if (email == null || email.isEmpty) return false;
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool _isValidPhone(String? phone) {
    if (phone == null || phone.isEmpty) return false;
    return RegExp(r'^\d{9,}$').hasMatch(phone.replaceAll(RegExp(r'[^\d]'), ''));
  }

  @override
  List<Object?> get props => [
        selectedBreed,
        petName,
        petGender,
        petNeutered,
        petPregnantOrLactating,
        petBirthDate,
        petSilhouette,
        petWeight,
        activityLevel,
        healthConditions,
        foodPreferences,
        ownerName,
        ownerEmail,
        ownerPhone,
        address,
        currentStep,
        isCompleted,
      ];
}
