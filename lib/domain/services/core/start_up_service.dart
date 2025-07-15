import 'package:dogfydiet_app/domain/services/core/system_preferences_service.dart';

class StartUpService {
  final SystemPreferencesService systemPreferencesService;

  const StartUpService({
    required this.systemPreferencesService,
  });

  Future<void> init() async {
    await systemPreferencesService.init();
  }
}
