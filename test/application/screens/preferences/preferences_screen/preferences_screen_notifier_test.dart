import 'package:dogfydiet_app/application/screens/preferences/preferences_screen/preferences_screen_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/value_objects/language.dart';
import 'package:dogfydiet_app/domain/repositories/language_repository.dart';
import 'package:dogfydiet_app/domain/services/core/system_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'preferences_screen_notifier_test.mocks.dart';

@GenerateMocks([SystemPreferencesService, LanguageRepository])
void main() {
  late MockSystemPreferencesService mockSystemPreferencesService;
  late MockLanguageRepository mockLanguageRepository;
  late ProviderContainer container;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    mockSystemPreferencesService = MockSystemPreferencesService();
    mockLanguageRepository = MockLanguageRepository();

    when(mockSystemPreferencesService.getIsDarkModeEnabled()).thenReturn(false);
    when(mockSystemPreferencesService.getSavedLanguage()).thenReturn(null);
    when(mockLanguageRepository.getSystemLanguage()).thenReturn(
      const Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US'),
    );
    when(mockLanguageRepository.getLanguages()).thenReturn([
      const Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US'),
      const Language(code: 'es', name: 'Español', flag: '🇪🇸', countryCode: 'ES'),
    ]);
    when(mockLanguageRepository.getDefaultLanguage()).thenReturn(
      const Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US'),
    );
    when(mockLanguageRepository.isLanguageSupported(any)).thenReturn(true);
    when(mockLanguageRepository.getLanguageByCode(any)).thenReturn(
      const Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US'),
    );
    when(mockSystemPreferencesService.setDarkModeEnabled(any)).thenAnswer((_) async {});
    when(mockSystemPreferencesService.setSavedLanguage(any)).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        systemPreferencesServiceProvider.overrideWithValue(mockSystemPreferencesService),
        languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  Future<void> pumpEventQueue() async {
    await Future.delayed(Duration.zero);
  }

  group('PreferencesNotifier', () {
    test('should return initial state', () {
      final state = container.read(preferencesNotifierProvider);

      expect(state.isDarkMode, false);
      expect(state.currentLocale, const Locale('en'));
      expect(state.themeMode, ThemeMode.light);
    });

    test('should load initial state with saved light mode', () async {
      container.dispose();

      when(mockSystemPreferencesService.getIsDarkModeEnabled()).thenReturn(true);
      when(mockSystemPreferencesService.getSavedLanguage()).thenReturn('es');
      when(mockLanguageRepository.isLanguageSupported('es')).thenReturn(true);

      container = ProviderContainer(
        overrides: [
          systemPreferencesServiceProvider.overrideWithValue(mockSystemPreferencesService),
          languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
        ],
      );

      container.read(preferencesNotifierProvider.notifier);
      await pumpEventQueue();

      final state = container.read(preferencesNotifierProvider);
      expect(state.isDarkMode, false);
      expect(state.themeMode, ThemeMode.light);
      expect(state.currentLocale, const Locale('en'));
    });

    test('should use system language when no saved language', () async {
      container.dispose();

      when(mockSystemPreferencesService.getSavedLanguage()).thenReturn(null);
      when(mockLanguageRepository.getSystemLanguage()).thenReturn(
        const Language(code: 'fr', name: 'Français', flag: '🇫🇷', countryCode: 'FR'),
      );

      container = ProviderContainer(
        overrides: [
          systemPreferencesServiceProvider.overrideWithValue(mockSystemPreferencesService),
          languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
        ],
      );

      container.read(preferencesNotifierProvider.notifier);
      await pumpEventQueue();

      final state = container.read(preferencesNotifierProvider);
      expect(state.currentLocale, const Locale('fr'));
    });

    test('should use system language when saved language is not supported', () async {
      container.dispose();

      when(mockSystemPreferencesService.getSavedLanguage()).thenReturn('unsupported');
      when(mockLanguageRepository.isLanguageSupported('unsupported')).thenReturn(false);
      when(mockLanguageRepository.getSystemLanguage()).thenReturn(
        const Language(code: 'de', name: 'Deutsch', flag: '🇩🇪', countryCode: 'DE'),
      );

      container = ProviderContainer(
        overrides: [
          systemPreferencesServiceProvider.overrideWithValue(mockSystemPreferencesService),
          languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
        ],
      );

      container.read(preferencesNotifierProvider.notifier);
      await pumpEventQueue();

      final state = container.read(preferencesNotifierProvider);
      expect(state.currentLocale, const Locale('de'));
    });

    test('should toggle dark mode', () async {
      final notifier = container.read(preferencesNotifierProvider.notifier);

      await notifier.toggleDarkMode(true);

      final state = container.read(preferencesNotifierProvider);
      expect(state.isDarkMode, true);
      expect(state.themeMode, ThemeMode.dark);
      verify(mockSystemPreferencesService.setDarkModeEnabled(true)).called(1);
    });

    test('should change language', () async {
      const newLanguageCode = 'es';
      when(mockLanguageRepository.isLanguageSupported(newLanguageCode)).thenReturn(true);
      final notifier = container.read(preferencesNotifierProvider.notifier);

      await notifier.changeLanguage(newLanguageCode);

      final state = container.read(preferencesNotifierProvider);
      expect(state.currentLocale, const Locale(newLanguageCode));
      verify(mockSystemPreferencesService.setSavedLanguage(newLanguageCode)).called(1);
    });

    test('should not change language if not supported', () async {
      const newLanguageCode = 'unsupported';
      when(mockLanguageRepository.isLanguageSupported(newLanguageCode)).thenReturn(false);
      final notifier = container.read(preferencesNotifierProvider.notifier);
      final initialState = container.read(preferencesNotifierProvider);

      await notifier.changeLanguage(newLanguageCode);

      final state = container.read(preferencesNotifierProvider);
      expect(state.currentLocale, initialState.currentLocale);
      verifyNever(mockSystemPreferencesService.setSavedLanguage(newLanguageCode));
    });

    test('should get supported languages', () {
      const languages = [
        Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US'),
        Language(code: 'es', name: 'Español', flag: '🇪🇸', countryCode: 'ES'),
      ];
      when(mockLanguageRepository.getLanguages()).thenReturn(languages);

      final notifier = container.read(preferencesNotifierProvider.notifier);
      final supportedLanguages = notifier.supportedLanguages;

      expect(supportedLanguages, languages);
    });

    test('should get language name', () {
      const language = Language(code: 'es', name: 'Español', flag: '🇪🇸', countryCode: 'ES');
      when(mockLanguageRepository.getLanguageByCode('es')).thenReturn(language);

      final notifier = container.read(preferencesNotifierProvider.notifier);
      final name = notifier.getLanguageName('es');

      expect(name, 'Español');
    });

    test('should get default language name when language not found', () {
      const defaultLanguage = Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US');
      when(mockLanguageRepository.getLanguageByCode('unknown')).thenReturn(null);
      when(mockLanguageRepository.getDefaultLanguage()).thenReturn(defaultLanguage);

      final notifier = container.read(preferencesNotifierProvider.notifier);
      final name = notifier.getLanguageName('unknown');

      expect(name, 'English');
    });

    test('should get language flag', () {
      const language = Language(code: 'es', name: 'Español', flag: '🇪🇸', countryCode: 'ES');
      when(mockLanguageRepository.getLanguageByCode('es')).thenReturn(language);

      final notifier = container.read(preferencesNotifierProvider.notifier);
      final flag = notifier.getLanguageFlag('es');

      expect(flag, '🇪🇸');
    });

    test('should get default language flag when language not found', () {
      const defaultLanguage = Language(code: 'en', name: 'English', flag: '🇺🇸', countryCode: 'US');
      when(mockLanguageRepository.getLanguageByCode('unknown')).thenReturn(null);
      when(mockLanguageRepository.getDefaultLanguage()).thenReturn(defaultLanguage);

      final notifier = container.read(preferencesNotifierProvider.notifier);
      final flag = notifier.getLanguageFlag('unknown');

      expect(flag, '🇺🇸');
    });

    test('should get current language code', () {
      final notifier = container.read(preferencesNotifierProvider.notifier);

      final code = notifier.currentLanguageCode;

      expect(code, 'en');
    });

    test('should check if language is selected', () {
      final notifier = container.read(preferencesNotifierProvider.notifier);

      expect(notifier.isLanguageSelected('en'), true);
      expect(notifier.isLanguageSelected('es'), false);
    });

    test('should update current language code after changing language', () async {
      when(mockLanguageRepository.isLanguageSupported('es')).thenReturn(true);
      final notifier = container.read(preferencesNotifierProvider.notifier);

      await notifier.changeLanguage('es');

      expect(notifier.currentLanguageCode, 'es');
      expect(notifier.isLanguageSelected('es'), true);
      expect(notifier.isLanguageSelected('en'), false);
    });
  });

  group('PreferencesState', () {
    test('should create state with correct values', () {
      const state = PreferencesState(
        isDarkMode: true,
        currentLocale: Locale('es'),
        themeMode: ThemeMode.dark,
      );

      expect(state.isDarkMode, true);
      expect(state.currentLocale, const Locale('es'));
      expect(state.themeMode, ThemeMode.dark);
    });

    test('should create new state with copyWith', () {
      const initialState = PreferencesState(
        isDarkMode: false,
        currentLocale: Locale('en'),
        themeMode: ThemeMode.light,
      );

      final newState = initialState.copyWith(
        isDarkMode: true,
        currentLocale: const Locale('es'),
        themeMode: ThemeMode.dark,
      );

      expect(newState.isDarkMode, true);
      expect(newState.currentLocale, const Locale('es'));
      expect(newState.themeMode, ThemeMode.dark);
    });

    test('should preserve existing values when copyWith is called with null', () {
      const initialState = PreferencesState(
        isDarkMode: true,
        currentLocale: Locale('es'),
        themeMode: ThemeMode.dark,
      );

      final newState = initialState.copyWith();

      expect(newState.isDarkMode, true);
      expect(newState.currentLocale, const Locale('es'));
      expect(newState.themeMode, ThemeMode.dark);
    });

    test('should support equality', () {
      const state1 = PreferencesState(
        isDarkMode: true,
        currentLocale: Locale('es'),
        themeMode: ThemeMode.dark,
      );

      const state2 = PreferencesState(
        isDarkMode: true,
        currentLocale: Locale('es'),
        themeMode: ThemeMode.dark,
      );

      expect(state1, equals(state2));
    });

    test('should support inequality', () {
      const state1 = PreferencesState(
        isDarkMode: true,
        currentLocale: Locale('es'),
        themeMode: ThemeMode.dark,
      );

      const state2 = PreferencesState(
        isDarkMode: false,
        currentLocale: Locale('en'),
        themeMode: ThemeMode.light,
      );

      expect(state1, isNot(equals(state2)));
    });
  });
}