import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/services/dog_breed_service.dart';

class DogBreedServiceImpl implements DogBreedService {

  static const List<Map<String, dynamic>> _mockData = [
    {
      'id': 1,
      'name': {
        'es': 'Labrador Retriever',
        'en': 'Labrador Retriever',
        'fr': 'Labrador Retriever',
        'it': 'Labrador Retriever',
      },
    },
    {
      'id': 2,
      'name': {
        'es': 'Pastor Alemán',
        'en': 'German Shepherd',
        'fr': 'Berger Allemand',
        'it': 'Pastore Tedesco',
      },
    },
    {
      'id': 3,
      'name': {
        'es': 'Golden Retriever',
        'en': 'Golden Retriever',
        'fr': 'Golden Retriever',
        'it': 'Golden Retriever',
      },
    },
    {
      'id': 4,
      'name': {
        'es': 'Bulldog Francés',
        'en': 'French Bulldog',
        'fr': 'Bouledogue Français',
        'it': 'Bulldog Francese',
      },
    },
    {
      'id': 5,
      'name': {
        'es': 'Bulldog',
        'en': 'Bulldog',
        'fr': 'Bouledogue',
        'it': 'Bulldog',
      },
    },
    {
      'id': 6,
      'name': {
        'es': 'Beagle',
        'en': 'Beagle',
        'fr': 'Beagle',
        'it': 'Beagle',
      },
    },
    {
      'id': 7,
      'name': {
        'es': 'Caniche',
        'en': 'Poodle',
        'fr': 'Caniche',
        'it': 'Barboncino',
      },
    },
    {
      'id': 8,
      'name': {
        'es': 'Rottweiler',
        'en': 'Rottweiler',
        'fr': 'Rottweiler',
        'it': 'Rottweiler',
      },
    },
    {
      'id': 9,
      'name': {
        'es': 'Yorkshire Terrier',
        'en': 'Yorkshire Terrier',
        'fr': 'Yorkshire Terrier',
        'it': 'Yorkshire Terrier',
      },
    },
    {
      'id': 10,
      'name': {
        'es': 'Teckel',
        'en': 'Dachshund',
        'fr': 'Teckel',
        'it': 'Bassotto',
      },
    },
    {
      'id': 11,
      'name': {
        'es': 'Border Collie',
        'en': 'Border Collie',
        'fr': 'Border Collie',
        'it': 'Border Collie',
      },
    },
    {
      'id': 12,
      'name': {
        'es': 'Husky Siberiano',
        'en': 'Siberian Husky',
        'fr': 'Husky Sibérien',
        'it': 'Husky Siberiano',
      },
    },
    {
      'id': 13,
      'name': {
        'es': 'Chihuahua',
        'en': 'Chihuahua',
        'fr': 'Chihuahua',
        'it': 'Chihuahua',
      },
    },
    {
      'id': 14,
      'name': {
        'es': 'Boxer',
        'en': 'Boxer',
        'fr': 'Boxer',
        'it': 'Boxer',
      },
    },
    {
      'id': 15,
      'name': {
        'es': 'Mestizo',
        'en': 'Mixed Breed',
        'fr': 'Race Mixte',
        'it': 'Meticcio',
      },
    }
  ];

  @override
  Future<List<DogBreed>> fetchAllBreeds() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulating http connection delay

    return _mockData.map((json) => DogBreed.fromJson(json)).toList();
  }
}
