abstract class SystemPreferencesService {
  Future<void> init();

  bool getIsDarkModeEnabled();
  Future<void> setDarkModeEnabled(bool isActive);

  String? getSavedLanguage();
  Future<void> setSavedLanguage(String languageCode);
}