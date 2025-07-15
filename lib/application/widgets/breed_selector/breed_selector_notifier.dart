import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breed_selector_notifier.g.dart';

@riverpod
class BreedSelectorNotifier extends _$BreedSelectorNotifier {

  @override
  BreedSelectorState build() {
    const initialState = BreedSelectorState(
      breeds: [],
      selectedBreed: null,
      isLoading: false,
      error: null,
    );

    Future.microtask(() => loadBreeds());
    return initialState;
  }

  Future<void> loadBreeds() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final dogBreedService = ref.read(dogBreedServiceProvider);
      final breeds = await dogBreedService.fetchAllBreeds();

      state = state.copyWith(
        breeds: breeds,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Error al cargar las razas: $e',
      );
    }
  }

  void selectBreed(DogBreed breed) {
    state = state.copyWith(selectedBreed: breed);
  }

  void clearSelection() {
    state = state.copyWith(selectedBreed: null);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class BreedSelectorState extends Equatable {
  final List<DogBreed> breeds;
  final DogBreed? selectedBreed;
  final bool isLoading;
  final String? error;

  const BreedSelectorState({
    required this.breeds,
    this.selectedBreed,
    required this.isLoading,
    this.error,
  });

  BreedSelectorState copyWith({
    List<DogBreed>? breeds,
    DogBreed? selectedBreed,
    bool? isLoading,
    String? error,
  }) {
    return BreedSelectorState(
      breeds: breeds ?? this.breeds,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        breeds,
        selectedBreed,
        isLoading,
        error,
      ];
}
