import 'package:dogfydiet_app/domain/model/value_objects/language.dart';
import 'package:dogfydiet_app/domain/repositories/language_repository.dart';
import 'package:flutter/widgets.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  static const List<Language> _supportedLanguages = [
    Language(
      code: 'es',
      name: 'Español',
      flag: '🇪🇸',
      countryCode: 'ES',
    ),
    Language(
      code: 'en',
      name: 'English',
      flag: '🇺🇸',
      countryCode: 'US',
    ),
    Language(
      code: 'fr',
      name: 'Français',
      flag: '🇫🇷',
      countryCode: 'FR',
    ),
    Language(
      code: 'it',
      name: 'Italiano',
      flag: '🇮🇹',
      countryCode: 'IT',
    ),
  ];

  @override
  List<Language> getLanguages() => _supportedLanguages;

  @override
  Language? getLanguageByCode(String code) {
    try {
      return _supportedLanguages.firstWhere((lang) => lang.code == code);
    } catch (e) {
      return null;
    }
  }

  @override
  Language getDefaultLanguage() => _supportedLanguages.first;

  @override
  Language getSystemLanguage() {
    try {
      final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
      final language = getLanguageByCode(systemLocale.languageCode);
      return language ?? getDefaultLanguage();
    } catch (e) {
      return getDefaultLanguage();
    }
  }

  @override
  bool isLanguageSupported(String code) => getLanguageByCode(code) != null;
}
