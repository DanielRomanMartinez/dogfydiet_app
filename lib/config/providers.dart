import 'package:dogfydiet_app/domain/repositories/language_repository.dart';
import 'package:dogfydiet_app/domain/services/core/router_service.dart';
import 'package:dogfydiet_app/domain/services/core/start_up_service.dart';
import 'package:dogfydiet_app/domain/services/core/system_preferences_service.dart';
import 'package:dogfydiet_app/domain/services/order/order_service.dart';
import 'package:dogfydiet_app/infraestructure/repositories/language_repository.dart';
import 'package:dogfydiet_app/infraestructure/services/core/system_preferences_service.dart';
import 'package:dogfydiet_app/infraestructure/services/order/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
RouterService routerService(Ref ref) {
  return const RouterService();
}

@riverpod
SystemPreferencesService systemPreferencesService(Ref ref) {
  return ImplSystemPreferencesService();
}

@riverpod
LanguageRepository languageRepository(Ref ref) {
  return LanguageRepositoryImpl();
}

@riverpod
OrderService orderService(Ref ref) {
  return OrderServiceImpl();
}

@riverpod
StartUpService startUpService(Ref ref) {
  final systemPreferencesService = ref.watch(systemPreferencesServiceProvider);
  return StartUpService(systemPreferencesService: systemPreferencesService);
}
