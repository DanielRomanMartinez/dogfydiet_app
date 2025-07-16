import 'package:dogfydiet_app/application/widgets/breed_selector/breed_selector_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/domain/services/dog_breed_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'breed_selector_notifier_test.mocks.dart';

@GenerateMocks([DogBreedService])
void main() {
  late MockDogBreedService mockDogBreedService;
  late ProviderContainer container;

  setUp(() {
    mockDogBreedService = MockDogBreedService();
    container = ProviderContainer(
      overrides: [
        dogBreedServiceProvider.overrideWithValue(mockDogBreedService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('BreedSelectorNotifier', () {
    test('should return initial state', () {
      final state = container.read(breedSelectorNotifierProvider);

      expect(state.breeds, isEmpty);
      expect(state.selectedBreed, isNull);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('should load breeds successfully', () async {
      const mockBreeds = [
        DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'}),
        DogBreed(id: 2, name: {'en': 'Golden Retriever', 'es': 'Golden Retriever'}),
      ];
      when(mockDogBreedService.fetchAllBreeds()).thenAnswer((_) async => mockBreeds);

      final notifier = container.read(breedSelectorNotifierProvider.notifier);
      await notifier.loadBreeds();

      final state = container.read(breedSelectorNotifierProvider);
      expect(state.breeds, mockBreeds);
      expect(state.isLoading, false);
      expect(state.error, isNull);
      verify(mockDogBreedService.fetchAllBreeds()).called(2);
    });

    test('should handle error when loading breeds', () async {
      const errorMessage = 'Network error';
      when(mockDogBreedService.fetchAllBreeds()).thenThrow(Exception(errorMessage));

      final notifier = container.read(breedSelectorNotifierProvider.notifier);
      await notifier.loadBreeds();

      final state = container.read(breedSelectorNotifierProvider);
      expect(state.breeds, isEmpty);
      expect(state.isLoading, false);
      expect(state.error, contains(errorMessage));
    });

    test('should select breed', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});

      final notifier = container.read(breedSelectorNotifierProvider.notifier);
      notifier.selectBreed(breed);

      final state = container.read(breedSelectorNotifierProvider);
      expect(state.selectedBreed, breed);
    });

    test('should clear selection', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final notifier = container.read(breedSelectorNotifierProvider.notifier);

      notifier.selectBreed(breed);

      var state = container.read(breedSelectorNotifierProvider);
      expect(state.selectedBreed, breed);

      notifier.clearSelection();

      state = container.read(breedSelectorNotifierProvider);
      expect(state.selectedBreed, isNull);
    });

    test('should clear error', () {
      final notifier = container.read(breedSelectorNotifierProvider.notifier);
      notifier.clearError();

      final state = container.read(breedSelectorNotifierProvider);
      expect(state.error, isNull);
    });

    test('should reload breeds after clearing error', () async {
      const mockBreeds = [
        DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'}),
      ];
      when(mockDogBreedService.fetchAllBreeds()).thenAnswer((_) async => mockBreeds);

      final notifier = container.read(breedSelectorNotifierProvider.notifier);
      await notifier.loadBreeds();

      final state = container.read(breedSelectorNotifierProvider);
      expect(state.breeds, mockBreeds);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('should set loading state while fetching breeds', () async {
      when(mockDogBreedService.fetchAllBreeds()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return [];
      });

      final notifier = container.read(breedSelectorNotifierProvider.notifier);
      final loadingFuture = notifier.loadBreeds();

      await Future.delayed(const Duration(milliseconds: 50));
      await loadingFuture;

      final state = container.read(breedSelectorNotifierProvider);
      expect(state.isLoading, false);
    });
  });

  group('BreedSelectorState', () {
    test('should create state with default values', () {
      const state = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      expect(state.breeds, isEmpty);
      expect(state.selectedBreed, isNull);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('should create new state with copyWith', () {
      const initialState = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final newState = initialState.copyWith(
        selectedBreed: breed,
        isLoading: true,
      );

      expect(newState.selectedBreed, breed);
      expect(newState.isLoading, true);
      expect(newState.breeds, isEmpty);
      expect(newState.error, isNull);
    });

    test('should clear selectedBreed with copyWith using clearSelectedBreed flag', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      const initialState = BreedSelectorState(
        breeds: [],
        selectedBreed: breed,
        isLoading: false,
        error: null,
      );

      final newState = initialState.copyWith(clearSelectedBreed: true);

      expect(newState.selectedBreed, isNull);
    });

    test('should handle copyWith with explicit null using clearSelection method', () {
      const breed = DogBreed(id: 1, name: {'en': 'Labrador', 'es': 'Labrador'});
      final notifier = container.read(breedSelectorNotifierProvider.notifier);

      notifier.selectBreed(breed);
      var state = container.read(breedSelectorNotifierProvider);
      expect(state.selectedBreed, breed);

      notifier.clearSelection();
      state = container.read(breedSelectorNotifierProvider);
      expect(state.selectedBreed, isNull);
    });

    test('should clear error with copyWith null', () {
      const initialState = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: 'Some error',
      );

      final newState = initialState.copyWith(error: null);

      expect(newState.error, isNull);
    });

    test('should support equality', () {
      const state1 = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      const state2 = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      expect(state1, equals(state2));
    });

    test('should support inequality', () {
      const state1 = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      const state2 = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: true,
        error: null,
      );

      expect(state1, isNot(equals(state2)));
    });
  });
}