import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_notifier.g.dart';

@riverpod
class HomeScreenNotifier extends _$HomeScreenNotifier {
  @override
  DogBreed? build() {
    return null;
  }

  void selectBreed(DogBreed breed) {
    state = breed;
  }

  void clearBreed() {
    state = null;
  }
}