import 'package:dogfydiet_app/domain/repositories/language_repository.dart';
import 'package:dogfydiet_app/domain/services/core/router_service.dart';
import 'package:dogfydiet_app/domain/services/core/start_up_service.dart';
import 'package:dogfydiet_app/domain/services/core/system_preferences_service.dart';
import 'package:dogfydiet_app/domain/services/dog_breed_service.dart';
import 'package:dogfydiet_app/domain/services/order_service.dart';
import 'package:dogfydiet_app/domain/services/subscription_service.dart';
import 'package:dogfydiet_app/infraestructure/repositories/language_repository.dart';
import 'package:dogfydiet_app/infraestructure/services/core/system_preferences_service.dart';
import 'package:dogfydiet_app/infraestructure/services/dog_breed_service.dart';
import 'package:dogfydiet_app/infraestructure/services/order_service.dart';
import 'package:dogfydiet_app/infraestructure/services/subscription_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
RouterService routerService(Ref ref) {
  final subscriptionService = ref.watch(subscriptionServiceProvider);
  return RouterService(subscriptionService: subscriptionService);
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
DogBreedService dogBreedService(Ref ref) {
  return DogBreedServiceImpl();
}

@riverpod
SubscriptionService subscriptionService(Ref ref) {
  return SubscriptionServiceImpl();
}

@riverpod
StartUpService startUpService(Ref ref) {
  final systemPreferencesService = ref.watch(systemPreferencesServiceProvider);
  return StartUpService(systemPreferencesService: systemPreferencesService);
}