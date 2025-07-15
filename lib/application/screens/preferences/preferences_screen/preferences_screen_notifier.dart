import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/value_objects/language.dart';
import 'package:dogfydiet_app/domain/repositories/language_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferences_screen_notifier.g.dart';

@riverpod
class PreferencesNotifier extends _$PreferencesNotifier {
  @override
  PreferencesState build() {
    final languageRepository = ref.read(languageRepositoryProvider);
    final initialState = PreferencesState(
      isDarkMode: false,
      currentLocale: _getDefaultLocale(languageRepository),
      themeMode: ThemeMode.light,
    );

    // Load initial state asynchronously
    _loadInitialState();

    return initialState;
  }

  List<Language> get supportedLanguages {
    final languageRepository = ref.read(languageRepositoryProvider);
    return languageRepository.getLanguages();
  }

  static Locale _getDefaultLocale(LanguageRepository languageRepository) {
    return Locale(languageRepository.getSystemLanguage().code);
  }

  void _loadInitialState() {
    Future.microtask(() {
      final preferencesService = ref.read(systemPreferencesServiceProvider);
      final languageRepository = ref.read(languageRepositoryProvider);

      final savedDarkMode = preferencesService.getIsDarkModeEnabled();
      final savedLanguage = preferencesService.getSavedLanguage();
      final locale = _getLocaleToUse(savedLanguage, languageRepository);

      state = state.copyWith(
        isDarkMode: savedDarkMode,
        currentLocale: locale,
        themeMode: _getThemeMode(savedDarkMode),
      );

      _updateSystemUIOverlay(savedDarkMode);
    });
  }

  Locale _getLocaleToUse(String? savedLanguage, languageRepository) {
    if (savedLanguage != null && savedLanguage.isNotEmpty) {
      if (languageRepository.isLanguageSupported(savedLanguage)) {
        return Locale(savedLanguage);
      }
    }

    return _getSystemLocale(languageRepository);
  }

  Locale _getSystemLocale(LanguageRepository languageRepository) {
    return Locale(languageRepository.getSystemLanguage().code);
  }

  ThemeMode _getThemeMode(bool isDarkMode) {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void _updateSystemUIOverlay(bool isDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
  }

  Future<void> toggleDarkMode(bool value) async {
    final preferencesService = ref.read(systemPreferencesServiceProvider);
    await preferencesService.setDarkModeEnabled(value);

    state = state.copyWith(
      isDarkMode: value,
      themeMode: _getThemeMode(value),
    );

    _updateSystemUIOverlay(value);
  }

  Future<void> changeLanguage(String languageCode) async {
    final preferencesService = ref.read(systemPreferencesServiceProvider);
    final languageRepository = ref.read(languageRepositoryProvider);

    if (languageRepository.isLanguageSupported(languageCode)) {
      await preferencesService.setSavedLanguage(languageCode);

      final newLocale = Locale(languageCode);
      state = state.copyWith(currentLocale: newLocale);
    }
  }

  String getLanguageName(String code) {
    final languageRepository = ref.read(languageRepositoryProvider);
    final language = languageRepository.getLanguageByCode(code);
    return language?.name ?? languageRepository.getDefaultLanguage().name;
  }

  String getLanguageFlag(String code) {
    final languageRepository = ref.read(languageRepositoryProvider);
    final language = languageRepository.getLanguageByCode(code);
    return language?.flag ?? languageRepository.getDefaultLanguage().flag;
  }

  String get currentLanguageCode => state.currentLocale.languageCode;

  bool isLanguageSelected(String code) {
    return state.currentLocale.languageCode == code;
  }
}

class PreferencesState extends Equatable {
  final bool isDarkMode;
  final Locale currentLocale;
  final ThemeMode themeMode;

  const PreferencesState({
    required this.isDarkMode,
    required this.currentLocale,
    required this.themeMode,
  });

  PreferencesState copyWith({
    bool? isDarkMode,
    Locale? currentLocale,
    ThemeMode? themeMode,
  }) {
    return PreferencesState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      currentLocale: currentLocale ?? this.currentLocale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [isDarkMode, currentLocale, themeMode];
}
