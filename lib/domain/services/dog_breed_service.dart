import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';

abstract class DogBreedService {
  Future<List<DogBreed>> fetchAllBreeds();
}
