import 'package:dogfydiet_app/domain/services/core/system_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplSystemPreferencesService implements SystemPreferencesService {
  static ImplSystemPreferencesService? _instance;
  late final SharedPreferences _sharedPreferences;
  bool _isInitialized = false;

  ImplSystemPreferencesService._internal();

  factory ImplSystemPreferencesService() {
    _instance ??= ImplSystemPreferencesService._internal();
    return _instance!;
  }

  @override
  Future<void> init() async {
    if (!_isInitialized) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _isInitialized = true;
    }
  }

  @override
  bool getIsDarkModeEnabled() {
    if (!_isInitialized) return false;
    return _sharedPreferences.getBool('dark_mode') ?? false;
  }

  @override
  Future<void> setDarkModeEnabled(bool isActive) async {
    if (_isInitialized) {
      await _sharedPreferences.setBool('dark_mode', isActive);
    }
  }

  @override
  String? getSavedLanguage() {
    if (!_isInitialized) return null;
    return _sharedPreferences.getString('saved_language');
  }

  @override
  Future<void> setSavedLanguage(String languageCode) async {
    if (_isInitialized) {
      await _sharedPreferences.setString('saved_language', languageCode);
    }
  }
}