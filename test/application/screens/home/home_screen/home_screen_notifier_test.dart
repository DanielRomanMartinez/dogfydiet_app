import 'package:dogfydiet_app/application/screens/home/home_screen/home_screen_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('HomeScreenNotifier', () {
    test('should return initial state as null', () {
      final state = container.read(homeScreenNotifierProvider);

      expect(state, isNull);
    });

    test('should select breed', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final notifier = container.read(homeScreenNotifierProvider.notifier);

      notifier.selectBreed(breed);

      final state = container.read(homeScreenNotifierProvider);
      expect(state, breed);
    });

    test('should clear breed', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final notifier = container.read(homeScreenNotifierProvider.notifier);
      notifier.selectBreed(breed);

      notifier.clearBreed();

      final state = container.read(homeScreenNotifierProvider);
      expect(state, isNull);
    });

    test('should update breed when selecting different breed', () {
      const breed1 = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      const breed2 = DogBreed(id: 2, name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'});
      final notifier = container.read(homeScreenNotifierProvider.notifier);

      notifier.selectBreed(breed1);
      notifier.selectBreed(breed2);

      final state = container.read(homeScreenNotifierProvider);
      expect(state, breed2);
      expect(state, isNot(breed1));
    });

    test('should handle multiple clear operations', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final notifier = container.read(homeScreenNotifierProvider.notifier);
      notifier.selectBreed(breed);

      notifier.clearBreed();
      notifier.clearBreed();

      final state = container.read(homeScreenNotifierProvider);
      expect(state, isNull);
    });

    test('should handle select after clear', () {
      const breed1 = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      const breed2 = DogBreed(id: 2, name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'});
      final notifier = container.read(homeScreenNotifierProvider.notifier);

      notifier.selectBreed(breed1);
      notifier.clearBreed();
      notifier.selectBreed(breed2);

      final state = container.read(homeScreenNotifierProvider);
      expect(state, breed2);
    });

    test('should handle clear after initial null state', () {
      final notifier = container.read(homeScreenNotifierProvider.notifier);

      notifier.clearBreed();

      final state = container.read(homeScreenNotifierProvider);
      expect(state, isNull);
    });

    test('should maintain breed reference integrity', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final notifier = container.read(homeScreenNotifierProvider.notifier);

      notifier.selectBreed(breed);

      final state = container.read(homeScreenNotifierProvider);
      expect(identical(state, breed), true);
    });
  });
}