import 'package:dogfydiet_app/config/providers.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_screen_notifier.g.dart';

@riverpod
class SplashScreenNotifier extends _$SplashScreenNotifier {
  @override
  SplashScreenState build() {
    return const SplashScreenState.initial();
  }

  void getNextPage() {
    state = const SplashScreenState.loading();

    Future.delayed(const Duration(milliseconds: 500), () {
      try {
        final routerService = ref.read(routerServiceProvider);
        final nextPage = routerService.getNextPage();
        state = SplashScreenState.success(nextPage: nextPage);
      } catch (e) {
        state = SplashScreenState.error(error: 'Error al obtener la siguiente página: $e');
      }
    });
  }

  void clearError() {
    state = const SplashScreenState.initial();
  }

  void reset() {
    state = const SplashScreenState.initial();
  }
}

class SplashScreenState extends Equatable {
  final bool isLoading;
  final String? nextPage;
  final String? error;

  const SplashScreenState._({
    this.isLoading = false,
    this.nextPage,
    this.error,
  });

  const SplashScreenState.initial() : this._();

  const SplashScreenState.loading() : this._(isLoading: true);

  const SplashScreenState.success({required String nextPage}) : this._(nextPage: nextPage);

  const SplashScreenState.error({required String error}) : this._(error: error);

  // Helper getters
  bool get hasNextPage => nextPage != null;
  bool get hasError => error != null;
  bool get isInitial => !isLoading && nextPage == null && error == null;

  @override
  List<Object?> get props => [isLoading, nextPage, error];
}
