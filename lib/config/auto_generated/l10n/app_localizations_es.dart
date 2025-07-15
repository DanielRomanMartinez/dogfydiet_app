// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get preferences => 'Preferencias';

  @override
  String get personalizeExperience => 'Personaliza tu experiencia';

  @override
  String get appearance => 'Apariencia';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get lightModeActive => 'Interfaz clara activada';

  @override
  String get darkModeActive => 'Interfaz oscura activada';

  @override
  String get language => 'Idioma';

  @override
  String get appLanguage => 'Idioma de la aplicación';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get configuration => 'Configuración';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get manageAlerts => 'Gestiona tus alertas';

  @override
  String get privacy => 'Privacidad';

  @override
  String get dataConfiguration => 'Configuración de datos';

  @override
  String get about => 'Acerca de';

  @override
  String get version => 'Versión 1.0.0';

  @override
  String get putRealFoodInBowl => 'Pon comida de verdad en el bol de tu perro';

  @override
  String get naturalFoodDescription =>
      'Comida natural para perros, completa y equilibrada. Elaborada por nutricionistas';

  @override
  String get whatBreedIsYourDog => '¿Qué raza es tu peludo?';

  @override
  String get createMenu => 'Crea su menú';

  @override
  String get improveDigestion => 'Mejoran digestiones';

  @override
  String get shinierCoat => 'Pelaje más brillante';

  @override
  String get moreEnergyVitality => 'Más energía y vitalidad';

  @override
  String get naturalIngredients => 'Ingredientes naturales';

  @override
  String get ourProducts => 'Nuestros productos';

  @override
  String get premiumMenus => 'Menús Premium';

  @override
  String get completeDaily => 'Comida completa diaria';

  @override
  String get naturalSnacks => 'Snacks Naturales';

  @override
  String get healthyTreats => 'Premios saludables';

  @override
  String get supplements => 'Suplementos';

  @override
  String get specificCare => 'Cuidado específico';

  @override
  String get accessories => 'Accesorios';

  @override
  String get everythingForYourDog => 'Todo para tu perro';

  @override
  String get featuredProducts => 'Productos destacados';

  @override
  String get viewAll => 'Ver todos';

  @override
  String get premiumChickenMenu => 'Menú Premium Pollo';

  @override
  String get richInProteins => 'Rico en proteínas y vegetales';

  @override
  String get premiumSalmonMenu => 'Menú Premium Salmón';

  @override
  String get withOmega3 => 'Con Omega-3 y arroz integral';

  @override
  String get premiumBeefMenu => 'Menú Premium Ternera';

  @override
  String get withMediterranean => 'Con verduras mediterráneas';

  @override
  String get whyChooseDogfy => '¿Por qué elegir Dogfy Diet?';

  @override
  String get scientificSupport => 'Respaldo científico';

  @override
  String get developedByVets =>
      'Desarrollado por veterinarios y nutricionistas';

  @override
  String get homeDelivery => 'Entrega a domicilio';

  @override
  String get receiveFreshFood => 'Recibe la comida fresca en tu puerta';

  @override
  String get personalized => 'Personalizado';

  @override
  String get menusAdapted => 'Menús adaptados a las necesidades de tu perro';

  @override
  String get selectBreed => 'Selecciona la raza de tu perro';

  @override
  String get goldenRetriever => 'Golden Retriever';

  @override
  String get labrador => 'Labrador';

  @override
  String get germanShepherd => 'Pastor Alemán';

  @override
  String get frenchBulldog => 'Bulldog Francés';

  @override
  String get borderCollie => 'Border Collie';

  @override
  String get siberianHusky => 'Husky Siberiano';

  @override
  String get chihuahua => 'Chihuahua';

  @override
  String get yorkshireTerrier => 'Yorkshire Terrier';

  @override
  String get boxer => 'Boxer';

  @override
  String get mixedBreed => 'Mestizo';

  @override
  String get other => 'Otro';

  @override
  String get myOrders => 'Mis Pedidos';

  @override
  String get manageAndReviewOrders => 'Gestiona y revisa tus pedidos';

  @override
  String orderNumber(String id) {
    return 'Pedido #$id';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count productos',
      one: '1 producto',
    );
    return '$_temp0';
  }

  @override
  String moreItems(int count) {
    return '+ $count más...';
  }

  @override
  String total(String amount) {
    return 'Total: €$amount';
  }

  @override
  String get changeStatus => 'Cambiar estado';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteOrder => 'Eliminar Pedido';

  @override
  String get deleteOrderConfirmation =>
      '¿Estás seguro de que quieres eliminar este pedido?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get filterByStatus => 'Filtrar por estado';

  @override
  String get all => 'Todos';

  @override
  String get totalOrders => 'Total Pedidos';

  @override
  String get totalValue => 'Valor Total';

  @override
  String get noOrdersWithStatus => 'No hay pedidos con este estado';

  @override
  String get noOrdersYet => 'No tienes pedidos aún';

  @override
  String get tryDifferentFilter =>
      'Prueba con un filtro diferente o revisa todos los pedidos';

  @override
  String get firstOrderMessage =>
      'Cuando realices tu primer pedido, aparecerá aquí';

  @override
  String get clearFilter => 'Limpiar filtro';

  @override
  String get goToShop => 'Ir a la tienda';

  @override
  String get orderDetails => 'Detalles del Pedido';

  @override
  String get customer => 'Cliente';

  @override
  String get email => 'Email';

  @override
  String get date => 'Fecha';

  @override
  String get notes => 'Notas';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get pending => 'Pendiente';

  @override
  String get processing => 'Procesando';

  @override
  String get shipped => 'Enviado';

  @override
  String get delivered => 'Entregado';

  @override
  String get cancelled => 'Cancelado';
}
