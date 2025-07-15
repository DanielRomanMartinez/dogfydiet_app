import 'package:dogfydiet_app/domain/model/value_objects/language.dart';

abstract class LanguageRepository {
  List<Language> getLanguages();
  Language? getLanguageByCode(String code);
  Language getDefaultLanguage();
  Language getSystemLanguage();
  bool isLanguageSupported(String code);
}