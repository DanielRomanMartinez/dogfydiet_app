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

  @override
  String get sureYouWantToLeave => '¿Seguro que quieres marcharte?';

  @override
  String get almostDoneDescription =>
      'Queda muy poquito para que tu perro empiece a disfrutar de su comida como nunca.';

  @override
  String get continueLater => 'Continuar luego';

  @override
  String get comeOnStay => 'Venga, me quedo';

  @override
  String aboutToChangeLife(String petName) {
    return 'Estás a punto de cambiar la vida de $petName';
  }

  @override
  String specificNeedsDescription(String petName) {
    return 'Debido a las necesidades específicas de $petName, así queda su plan personalizado.';
  }

  @override
  String get yourDog => 'Tu perro';

  @override
  String dailyAmount(String amount) {
    return '$amount/día';
  }

  @override
  String pricePerDay(String price) {
    return 'Precio: $price €/día';
  }

  @override
  String packetsDescription(String packets) {
    return '$packets bolsitas, 1 bolsitas/día';
  }

  @override
  String get recommended => 'RECOMENDADO';

  @override
  String get hisPlan => 'Su plan: ';

  @override
  String get price => 'Precio: ';

  @override
  String get perDay => '/día';

  @override
  String get trial14Days => 'Prueba 14 días';

  @override
  String discountLabel(int discount) {
    return '-$discount% 🎉';
  }

  @override
  String get observePositiveChanges =>
      'Observan cambios positivos por el cambio de alimentación';

  @override
  String get noticeDigestionImprovements => 'Notan mejoras en las digestiones';

  @override
  String get healthierShinerCoat => 'Lucen un pelaje más sano y brillante';

  @override
  String receiveMenuWherever(String petName) {
    return 'Recibe el menú de $petName donde quieras';
  }

  @override
  String get nextAvailableDate => 'Próxima fecha disponible';

  @override
  String get edit => 'Editar';

  @override
  String get deliveryData => 'Datos de entrega';

  @override
  String get name => 'Nombre';

  @override
  String get myNameIs => 'Mi nombre es...';

  @override
  String get mySurnameIs => 'Mi apellido es...';

  @override
  String get fullAddress =>
      'Dirección completa (ej.: Calle de Finisterre, 5, 3ª)';

  @override
  String get myAddressIs => 'Mi dirección es...';

  @override
  String get locality => 'Localidad / Ciudad';

  @override
  String get myLocalityIs => 'Mi localidad es...';

  @override
  String get postalCode => 'Código postal';

  @override
  String get myPostalCodeIs => 'Mi código postal es...';

  @override
  String get country => 'País';

  @override
  String get spain => 'España';

  @override
  String get paymentData => 'Datos de pago';

  @override
  String get finalizeDogfyDiet => 'Finalizar Dogfy Diet';

  @override
  String get card => 'Tarjeta';

  @override
  String get cardNumber => 'Número de tarjeta';

  @override
  String get securityCode => 'Código de seguridad';

  @override
  String needsDaily(String petName, String amount) {
    return '$petName necesita $amount/día';
  }

  @override
  String trialPeriodPrice(String price) {
    return 'Una vez finalice el período de prueba, el precio de tu plan mensual quedará en $price €/semana';
  }

  @override
  String get promoCodeQuestion => '¿Tienes algún código promocional?';

  @override
  String get orderContents => 'Lo que contiene tu pedido';

  @override
  String get chickenMenu => 'Menú de pollo';

  @override
  String get turkeyMenu => 'Menú de pavo';

  @override
  String get salmonMenu => 'Menú de salmón';

  @override
  String get beefMenu => 'Menú de buey';

  @override
  String get welcomePack => 'Pack de bienvenida';

  @override
  String get free => 'GRATIS';

  @override
  String get freeShipping => 'Envío gratis';

  @override
  String get securePayment => 'Pago seguro';

  @override
  String get flexibility => 'Flexibilidad';

  @override
  String activityLevelQuestion(String petName) {
    return '¿Cuál es el nivel de actividad de $petName? 🏃‍♀️';
  }

  @override
  String get chooseActivityLevel =>
      'Elige el nivel de actividad que mejor le describe.';

  @override
  String get selectOptionForDescription =>
      'Selecciona una opción para ver la descripción';

  @override
  String get lowActivityDescription =>
      '🐕 Perrita alfombra: paseos diarios de menos de 1h. Lo que más le gusta es echarse una buena siesta 😴 y estar bien tranquilita.';

  @override
  String get mediumActivityDescription =>
      '🐕 Perrita zen: paseos diarios de 1 a 2h. Sabe disfrutar de buenas caminatas, pero también sabe cuándo descansar 😊';

  @override
  String get highActivityDescription =>
      '🐕 Perrita terremoto: paseos diarios de más de 2h. ¡No veas qué torbellino de energía! 💪';

  @override
  String silhouetteQuestion(String petName) {
    return '¿Qué silueta representa mejor a $petName?';
  }

  @override
  String get selectSimilarFigure =>
      'Selecciona la figura que más se asemeja en cuanto a su peso y forma 🐕';

  @override
  String weightDescription(String petName) {
    return 'El peso de $petName es más o menos de';
  }

  @override
  String get kg => 'kg';

  @override
  String get whyImportant => '¿Por qué es importante? 🤔';

  @override
  String get thinSilhouetteDescription =>
      'Hecho un figurín: La cintura es visible y sus costillas son fáciles de palpar.';

  @override
  String get normalSilhouetteDescription =>
      'En su peso ideal: Se ve proporcionado y saludable.';

  @override
  String get overweightSilhouetteDescription =>
      'Un poco rellenito: Se nota algo de sobrepeso, pero nada grave.';

  @override
  String birthDateQuestion(String petName) {
    return '¿Cuándo nació $petName?';
  }

  @override
  String get calorieNeedsVaryByAge =>
      'Las necesidades calóricas varían según la edad de tu perrhija, pero nos adaptaremos perfectamente a su momento vital 😊';

  @override
  String get january => 'Enero';

  @override
  String get february => 'Febrero';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Abril';

  @override
  String get may => 'Mayo';

  @override
  String get june => 'Junio';

  @override
  String get july => 'Julio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Septiembre';

  @override
  String get october => 'Octubre';

  @override
  String get november => 'Noviembre';

  @override
  String get december => 'Diciembre';

  @override
  String get breedQuestion => '¿Cuál es la raza de tu perrete?';

  @override
  String get searchBreedPlaceholder => 'Busca o escribe su raza 🐶';

  @override
  String get foodCriticQuestion =>
      '¿Qué crítica gastronómica es tu perrhija? 🍽️ 🐕';

  @override
  String chooseFoodOption(String petName) {
    return 'Elige la opción que mejor describe a $petName';
  }

  @override
  String get selective => 'Selectivo';

  @override
  String get gourmet => 'Gourmet';

  @override
  String get eatsEverything => 'Come todo';

  @override
  String get selectiveDescription =>
      'El selectivo: muy exigente con la comida, solo come lo que realmente le gusta 🤔';

  @override
  String get gourmetDescription =>
      'La gourmet: le encanta probar nuevos sabores, pero no se conforma con cualquier cosa 🤤';

  @override
  String get eatsEverythingDescription =>
      'Come de todo: no hay comida que se le resista, siempre está dispuesto a probar 😋';

  @override
  String healthConditionsQuestion(String petName) {
    return '¿Tiene $petName alguna patología?';
  }

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get selectedPathologies => 'Patologías seleccionadas:';

  @override
  String get everyDogIsAWorld => 'Cada perro es un mundo 🌍';

  @override
  String get dontWorryAdaptMenu =>
      '¡No te preocupes! 🧡 Adaptaremos nuestro menú a su caso, siempre que sea posible. Si la patología de tu perro no aparece en el formulario, envía un correo a nutricionistas@dogfydiet.com.';

  @override
  String get selectPathology => 'Selecciona una patología';

  @override
  String get allergiesIntolerances => 'Alergias e intolerancias alimenticias';

  @override
  String get sensitiveDigestion => 'Digestiones sensibles';

  @override
  String get skinProblems => 'Problemas de piel';

  @override
  String get jointProblems => 'Problemas articulares';

  @override
  String get dentalProblems => 'Problemas dentales';

  @override
  String get diabetes => 'Diabetes';

  @override
  String get kidneyProblems => 'Problemas renales';

  @override
  String get heartProblems => 'Problemas cardíacos';

  @override
  String get overweight => 'Sobrepeso';

  @override
  String get underweight => 'Bajo peso';

  @override
  String specialMenuAlmostReady(String petName) {
    return '¡El menú especial para $petName está casi listo!';
  }

  @override
  String get acceptTermsMessage =>
      'Al continuar, se guardará tu proceso y estarás aceptando los términos y condiciones y la política de privacidad para recibir las mejores recomendaciones sobre alimentación. 🧡';

  @override
  String wantToKnowPet(String petName) {
    return '¡Queremos conocer a $petName!';
  }

  @override
  String get male => 'Macho';

  @override
  String get female => 'Hembra';

  @override
  String get isNeutered => '¿Está esterilizado/a?';

  @override
  String isPregnantOrLactating(String petName) {
    return '¿$petName es gestante o lactante?';
  }

  @override
  String get yourFemale => 'Tu perra';

  @override
  String get afterNeuteringAdjustments =>
      'Después de la esterilización, se requieren ajustes en la ración, ya que el perro suele tener menor gasto calórico.';

  @override
  String petNameQuestion(String breed) {
    return '¿Cómo se llama tu $breed?';
  }

  @override
  String get dog => 'perro';

  @override
  String get myDogIsCalled => 'Mi perrhijo se llama...';

  @override
  String excitementImproveLife(String breed) {
    return '¡Qué emoción! 🥳 Estás a punto de mejorar la vida de tu $breed a través de una alimentación 100% natural.';
  }

  @override
  String puppyExclamation(String petName) {
    return '¡$petName es un cachorro! 🥰';
  }

  @override
  String get importantKnowCurrentWeight =>
      'Es importante saber su peso actual para calcular su ración ideal.';

  @override
  String get knowPuppyWeightFundamental =>
      'Conocer el peso de tu cachorro es fundamental para adaptar el plan de alimentación a su etapa de desarrollo.';

  @override
  String get back => 'Atrás';

  @override
  String get continueButton => 'Continuar';
}
