// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get preferences => 'Preferenze';

  @override
  String get personalizeExperience => 'Personalizza la tua esperienza';

  @override
  String get appearance => 'Aspetto';

  @override
  String get darkMode => 'Modalità scura';

  @override
  String get lightModeActive => 'Interfaccia chiara attivata';

  @override
  String get darkModeActive => 'Interfaccia scura attivata';

  @override
  String get language => 'Lingua';

  @override
  String get appLanguage => 'Lingua dell\'applicazione';

  @override
  String get selectLanguage => 'Seleziona lingua';

  @override
  String get configuration => 'Configurazione';

  @override
  String get notifications => 'Notifiche';

  @override
  String get manageAlerts => 'Gestisci i tuoi avvisi';

  @override
  String get privacy => 'Privacy';

  @override
  String get dataConfiguration => 'Configurazione dati';

  @override
  String get about => 'Informazioni';

  @override
  String get version => 'Versione 1.0.0';

  @override
  String get putRealFoodInBowl => 'Metti vero cibo nella ciotola del tuo cane';

  @override
  String get naturalFoodDescription =>
      'Cibo naturale per cani, completo ed equilibrato. Elaborato da nutrizionisti';

  @override
  String get whatBreedIsYourDog => 'Che razza è il tuo peloso?';

  @override
  String get createMenu => 'Crea il suo menu';

  @override
  String get improveDigestion => 'Migliorano la digestione';

  @override
  String get shinierCoat => 'Pelo più brillante';

  @override
  String get moreEnergyVitality => 'Più energia e vitalità';

  @override
  String get naturalIngredients => 'Ingredienti naturali';

  @override
  String get ourProducts => 'I nostri prodotti';

  @override
  String get premiumMenus => 'Menu Premium';

  @override
  String get completeDaily => 'Cibo completo quotidiano';

  @override
  String get naturalSnacks => 'Snack Naturali';

  @override
  String get healthyTreats => 'Premi salutari';

  @override
  String get supplements => 'Integratori';

  @override
  String get specificCare => 'Cura specifica';

  @override
  String get accessories => 'Accessori';

  @override
  String get everythingForYourDog => 'Tutto per il tuo cane';

  @override
  String get featuredProducts => 'Prodotti in evidenza';

  @override
  String get viewAll => 'Vedi tutti';

  @override
  String get premiumChickenMenu => 'Menu Premium Pollo';

  @override
  String get richInProteins => 'Ricco di proteine e verdure';

  @override
  String get premiumSalmonMenu => 'Menu Premium Salmone';

  @override
  String get withOmega3 => 'Con Omega-3 e riso integrale';

  @override
  String get premiumBeefMenu => 'Menu Premium Manzo';

  @override
  String get withMediterranean => 'Con verdure mediterranee';

  @override
  String get whyChooseDogfy => 'Perché scegliere Dogfy Diet?';

  @override
  String get scientificSupport => 'Supporto scientifico';

  @override
  String get developedByVets => 'Sviluppato da veterinari e nutrizionisti';

  @override
  String get homeDelivery => 'Consegna a domicilio';

  @override
  String get receiveFreshFood => 'Ricevi cibo fresco alla tua porta';

  @override
  String get personalized => 'Personalizzato';

  @override
  String get menusAdapted => 'Menu adattati alle esigenze del tuo cane';

  @override
  String get selectBreed => 'Seleziona la razza del tuo cane';

  @override
  String get goldenRetriever => 'Golden Retriever';

  @override
  String get labrador => 'Labrador';

  @override
  String get germanShepherd => 'Pastore Tedesco';

  @override
  String get frenchBulldog => 'Bulldog Francese';

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
  String get mixedBreed => 'Meticcio';

  @override
  String get other => 'Altro';

  @override
  String get myOrders => 'I Miei Ordini';

  @override
  String get manageAndReviewOrders => 'Gestisci e rivedi i tuoi ordini';

  @override
  String orderNumber(String id) {
    return 'Ordine #$id';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prodotti',
      one: '1 prodotto',
    );
    return '$_temp0';
  }

  @override
  String moreItems(int count) {
    return '+ $count altri...';
  }

  @override
  String total(String amount) {
    return 'Totale: €$amount';
  }

  @override
  String get changeStatus => 'Cambia stato';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteOrder => 'Elimina Ordine';

  @override
  String get deleteOrderConfirmation =>
      'Sei sicuro di voler eliminare questo ordine?';

  @override
  String get cancel => 'Annulla';

  @override
  String get filterByStatus => 'Filtra per stato';

  @override
  String get all => 'Tutti';

  @override
  String get totalOrders => 'Totale Ordini';

  @override
  String get totalValue => 'Valore Totale';

  @override
  String get noOrdersWithStatus => 'Nessun ordine con questo stato';

  @override
  String get noOrdersYet => 'Non hai ancora ordini';

  @override
  String get tryDifferentFilter =>
      'Prova un filtro diverso o controlla tutti gli ordini';

  @override
  String get firstOrderMessage =>
      'Quando effettuerai il tuo primo ordine, apparirà qui';

  @override
  String get clearFilter => 'Cancella filtro';

  @override
  String get goToShop => 'Vai al negozio';

  @override
  String get orderDetails => 'Dettagli dell\'Ordine';

  @override
  String get customer => 'Cliente';

  @override
  String get email => 'Email';

  @override
  String get date => 'Data';

  @override
  String get notes => 'Note';

  @override
  String get subtotal => 'Subtotale';

  @override
  String get pending => 'In sospeso';

  @override
  String get processing => 'In elaborazione';

  @override
  String get shipped => 'Spedito';

  @override
  String get delivered => 'Consegnato';

  @override
  String get cancelled => 'Annullato';
}
