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

  @override
  String get sureYouWantToLeave => 'Sei sicuro di voler andartene?';

  @override
  String get almostDoneDescription =>
      'Il tuo cane è molto vicino a iniziare a godersi il suo cibo come mai prima.';

  @override
  String get continueLater => 'Continua più tardi';

  @override
  String get comeOnStay => 'Dai, rimango';

  @override
  String aboutToChangeLife(String petName) {
    return 'Stai per cambiare la vita di $petName';
  }

  @override
  String specificNeedsDescription(String petName) {
    return 'A causa delle esigenze specifiche di $petName, ecco come appare il suo piano personalizzato.';
  }

  @override
  String get yourDog => 'Il tuo cane';

  @override
  String dailyAmount(String amount) {
    return '$amount/giorno';
  }

  @override
  String pricePerDay(String price) {
    return 'Prezzo: $price €/giorno';
  }

  @override
  String packetsDescription(String packets) {
    return '$packets bustine, 1 bustina/giorno';
  }

  @override
  String get recommended => 'CONSIGLIATO';

  @override
  String get hisPlan => 'Il suo piano: ';

  @override
  String get price => 'Prezzo: ';

  @override
  String get perDay => '/giorno';

  @override
  String get trial14Days => 'Prova di 14 giorni';

  @override
  String discountLabel(int discount) {
    return '-$discount% 🎉';
  }

  @override
  String get observePositiveChanges =>
      'Osservano cambiamenti positivi per il cambio di alimentazione';

  @override
  String get noticeDigestionImprovements =>
      'Notano miglioramenti nelle digestioni';

  @override
  String get healthierShinerCoat => 'Mostrano un pelo più sano e brillante';

  @override
  String receiveMenuWherever(String petName) {
    return 'Ricevi il menu di $petName dove vuoi';
  }

  @override
  String get nextAvailableDate => 'Prossima data disponibile';

  @override
  String get edit => 'Modifica';

  @override
  String get deliveryData => 'Dati di consegna';

  @override
  String get name => 'Nome';

  @override
  String get myNameIs => 'Il mio nome è...';

  @override
  String get mySurnameIs => 'Il mio cognome è...';

  @override
  String get fullAddress => 'Indirizzo completo (es.: Via Finisterre, 5, 3°)';

  @override
  String get myAddressIs => 'Il mio indirizzo è...';

  @override
  String get locality => 'Località / Città';

  @override
  String get myLocalityIs => 'La mia località è...';

  @override
  String get postalCode => 'Codice postale';

  @override
  String get myPostalCodeIs => 'Il mio codice postale è...';

  @override
  String get country => 'Paese';

  @override
  String get spain => 'Spagna';

  @override
  String get paymentData => 'Dati di pagamento';

  @override
  String get finalizeDogfyDiet => 'Finalizza Dogfy Diet';

  @override
  String get card => 'Carta';

  @override
  String get cardNumber => 'Numero di carta';

  @override
  String get securityCode => 'Codice di sicurezza';

  @override
  String needsDaily(String petName, String amount) {
    return '$petName ha bisogno di $amount/giorno';
  }

  @override
  String trialPeriodPrice(String price) {
    return 'Una volta finito il periodo di prova, il prezzo del tuo piano mensile sarà $price €/settimana';
  }

  @override
  String get promoCodeQuestion => 'Hai qualche codice promozionale?';

  @override
  String get orderContents => 'Cosa contiene il tuo ordine';

  @override
  String get chickenMenu => 'Menu di pollo';

  @override
  String get turkeyMenu => 'Menu di tacchino';

  @override
  String get salmonMenu => 'Menu di salmone';

  @override
  String get beefMenu => 'Menu di manzo';

  @override
  String get welcomePack => 'Pack di benvenuto';

  @override
  String get free => 'GRATIS';

  @override
  String get freeShipping => 'Spedizione gratuita';

  @override
  String get securePayment => 'Pagamento sicuro';

  @override
  String get flexibility => 'Flessibilità';

  @override
  String activityLevelQuestion(String petName) {
    return 'Qual è il livello di attività di $petName? 🏃‍♀️';
  }

  @override
  String get chooseActivityLevel =>
      'Scegli il livello di attività che lo descrive meglio.';

  @override
  String get selectOptionForDescription =>
      'Seleziona un\'opzione per vedere la descrizione';

  @override
  String get lowActivityDescription =>
      '🐕 Cane tappeto: passeggiate quotidiane di meno di 1h. Quello che ama di più è fare un bel pisolino 😴 e stare molto tranquillo.';

  @override
  String get mediumActivityDescription =>
      '🐕 Cane zen: passeggiate quotidiane da 1 a 2h. Sa godere di buone camminate, ma sa anche quando riposare 😊';

  @override
  String get highActivityDescription =>
      '🐕 Cane terremoto: passeggiate quotidiane di più di 2h. Che turbine di energia! 💪';

  @override
  String silhouetteQuestion(String petName) {
    return 'Quale silhouette rappresenta meglio $petName?';
  }

  @override
  String get selectSimilarFigure =>
      'Seleziona la figura che più somiglia in quanto a peso e forma 🐕';

  @override
  String weightDescription(String petName) {
    return 'Il peso di $petName è più o meno di';
  }

  @override
  String get kg => 'kg';

  @override
  String get whyImportant => 'Perché è importante? 🤔';

  @override
  String get thinSilhouetteDescription =>
      'Fatto un figurino: La vita è visibile e le sue costole sono facili da palpare.';

  @override
  String get normalSilhouetteDescription =>
      'Al suo peso ideale: Appare proporzionato e sano.';

  @override
  String get overweightSilhouetteDescription =>
      'Un po\' paffuto: Si nota un po\' di sovrappeso, ma niente di grave.';

  @override
  String birthDateQuestion(String petName) {
    return 'Quando è nato $petName?';
  }

  @override
  String get calorieNeedsVaryByAge =>
      'I bisogni calorici variano secondo l\'età del tuo cane, ma ci adatteremo perfettamente al suo momento vitale 😊';

  @override
  String get january => 'Gennaio';

  @override
  String get february => 'Febbraio';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Aprile';

  @override
  String get may => 'Maggio';

  @override
  String get june => 'Giugno';

  @override
  String get july => 'Luglio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Settembre';

  @override
  String get october => 'Ottobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Dicembre';

  @override
  String get breedQuestion => 'Qual è la razza del tuo piccolo?';

  @override
  String get searchBreedPlaceholder => 'Cerca o scrivi la sua razza 🐶';

  @override
  String get foodCriticQuestion =>
      'Che critico gastronomico è il tuo cane? 🍽️ 🐕';

  @override
  String chooseFoodOption(String petName) {
    return 'Scegli l\'opzione che descrive meglio $petName';
  }

  @override
  String get selective => 'Selettivo';

  @override
  String get gourmet => 'Gourmet';

  @override
  String get eatsEverything => 'Mangia tutto';

  @override
  String get selectiveDescription =>
      'Il selettivo: molto esigente con il cibo, mangia solo quello che gli piace davvero 🤔';

  @override
  String get gourmetDescription =>
      'Il gourmet: adora provare nuovi sapori, ma non si accontenta di qualsiasi cosa 🤤';

  @override
  String get eatsEverythingDescription =>
      'Mangia tutto: non c\'è cibo che gli resista, sempre disposto a provare 😋';

  @override
  String healthConditionsQuestion(String petName) {
    return '$petName ha qualche patologia?';
  }

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get selectedPathologies => 'Patologie selezionate:';

  @override
  String get everyDogIsAWorld => 'Ogni cane è un mondo 🌍';

  @override
  String get dontWorryAdaptMenu =>
      'Non preoccuparti! 🧡 Adatteremo il nostro menu al suo caso, quando possibile. Se la patologia del tuo cane non appare nel modulo, invia un\'email a nutricionisti@dogfydiet.com.';

  @override
  String get selectPathology => 'Seleziona una patologia';

  @override
  String get allergiesIntolerances => 'Allergie e intolleranze alimentari';

  @override
  String get sensitiveDigestion => 'Digestioni sensibili';

  @override
  String get skinProblems => 'Problemi di pelle';

  @override
  String get jointProblems => 'Problemi articolari';

  @override
  String get dentalProblems => 'Problemi dentali';

  @override
  String get diabetes => 'Diabete';

  @override
  String get kidneyProblems => 'Problemi renali';

  @override
  String get heartProblems => 'Problemi cardiaci';

  @override
  String get overweight => 'Sovrappeso';

  @override
  String get underweight => 'Sottopeso';

  @override
  String specialMenuAlmostReady(String petName) {
    return 'Il menu speciale per $petName è quasi pronto!';
  }

  @override
  String get acceptTermsMessage =>
      'Continuando, il tuo progresso sarà salvato e accetterai i termini e condizioni e la politica sulla privacy per ricevere le migliori raccomandazioni nutrizionali. 🧡';

  @override
  String wantToKnowPet(String petName) {
    return 'Vogliamo conoscere $petName!';
  }

  @override
  String get male => 'Maschio';

  @override
  String get female => 'Femmina';

  @override
  String get isNeutered => 'È sterilizzato/a?';

  @override
  String isPregnantOrLactating(String petName) {
    return '$petName è incinta o in allattamento?';
  }

  @override
  String get yourFemale => 'La tua cagnolina';

  @override
  String get afterNeuteringAdjustments =>
      'Dopo la sterilizzazione, sono necessari aggiustamenti nella razione, poiché il cane di solito ha un minor dispendio calorico.';

  @override
  String petNameQuestion(String breed) {
    return 'Come si chiama il tuo $breed?';
  }

  @override
  String get dog => 'cane';

  @override
  String get myDogIsCalled => 'Il mio cane si chiama...';

  @override
  String excitementImproveLife(String breed) {
    return 'Che emozione! 🥳 Stai per migliorare la vita del tuo $breed attraverso un\'alimentazione 100% naturale.';
  }

  @override
  String puppyExclamation(String petName) {
    return '$petName è un cucciolo! 🥰';
  }

  @override
  String get importantKnowCurrentWeight =>
      'È importante sapere il suo peso attuale per calcolare la sua razione ideale.';

  @override
  String get knowPuppyWeightFundamental =>
      'Conoscere il peso del tuo cucciolo è fondamentale per adattare il piano alimentare alla sua fase di sviluppo.';

  @override
  String get back => 'Indietro';

  @override
  String get continueButton => 'Continua';
}
