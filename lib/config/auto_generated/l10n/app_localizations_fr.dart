// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get preferences => 'Préférences';

  @override
  String get personalizeExperience => 'Personnalisez votre expérience';

  @override
  String get appearance => 'Apparence';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get lightModeActive => 'Interface claire activée';

  @override
  String get darkModeActive => 'Interface sombre activée';

  @override
  String get language => 'Langue';

  @override
  String get appLanguage => 'Langue de l\'application';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get configuration => 'Configuration';

  @override
  String get notifications => 'Notifications';

  @override
  String get manageAlerts => 'Gérer vos alertes';

  @override
  String get privacy => 'Confidentialité';

  @override
  String get dataConfiguration => 'Configuration des données';

  @override
  String get about => 'À propos';

  @override
  String get version => 'Version 1.0.0';

  @override
  String get putRealFoodInBowl =>
      'Mettez de la vraie nourriture dans la gamelle de votre chien';

  @override
  String get naturalFoodDescription =>
      'Nourriture naturelle pour chiens, complète et équilibrée. Élaborée par des nutritionnistes';

  @override
  String get whatBreedIsYourDog => 'Quelle race est votre compagnon ?';

  @override
  String get createMenu => 'Créer son menu';

  @override
  String get improveDigestion => 'Améliorer la digestion';

  @override
  String get shinierCoat => 'Pelage plus brillant';

  @override
  String get moreEnergyVitality => 'Plus d\'énergie et de vitalité';

  @override
  String get naturalIngredients => 'Ingrédients naturels';

  @override
  String get ourProducts => 'Nos produits';

  @override
  String get premiumMenus => 'Menus Premium';

  @override
  String get completeDaily => 'Nourriture complète quotidienne';

  @override
  String get naturalSnacks => 'Snacks Naturels';

  @override
  String get healthyTreats => 'Friandises saines';

  @override
  String get supplements => 'Suppléments';

  @override
  String get specificCare => 'Soins spécifiques';

  @override
  String get accessories => 'Accessoires';

  @override
  String get everythingForYourDog => 'Tout pour votre chien';

  @override
  String get featuredProducts => 'Produits vedettes';

  @override
  String get viewAll => 'Voir tout';

  @override
  String get premiumChickenMenu => 'Menu Premium Poulet';

  @override
  String get richInProteins => 'Riche en protéines et légumes';

  @override
  String get premiumSalmonMenu => 'Menu Premium Saumon';

  @override
  String get withOmega3 => 'Avec Omega-3 et riz complet';

  @override
  String get premiumBeefMenu => 'Menu Premium Bœuf';

  @override
  String get withMediterranean => 'Avec légumes méditerranéens';

  @override
  String get whyChooseDogfy => 'Pourquoi choisir Dogfy Diet ?';

  @override
  String get scientificSupport => 'Soutien scientifique';

  @override
  String get developedByVets =>
      'Développé par des vétérinaires et nutritionnistes';

  @override
  String get homeDelivery => 'Livraison à domicile';

  @override
  String get receiveFreshFood => 'Recevez la nourriture fraîche à votre porte';

  @override
  String get personalized => 'Personnalisé';

  @override
  String get menusAdapted => 'Menus adaptés aux besoins de votre chien';

  @override
  String get selectBreed => 'Sélectionnez la race de votre chien';

  @override
  String get goldenRetriever => 'Golden Retriever';

  @override
  String get labrador => 'Labrador';

  @override
  String get germanShepherd => 'Berger Allemand';

  @override
  String get frenchBulldog => 'Bouledogue Français';

  @override
  String get borderCollie => 'Border Collie';

  @override
  String get siberianHusky => 'Husky Sibérien';

  @override
  String get chihuahua => 'Chihuahua';

  @override
  String get yorkshireTerrier => 'Yorkshire Terrier';

  @override
  String get boxer => 'Boxer';

  @override
  String get mixedBreed => 'Race mixte';

  @override
  String get other => 'Autre';

  @override
  String get myOrders => 'Mes Commandes';

  @override
  String get manageAndReviewOrders => 'Gérez et consultez vos commandes';

  @override
  String orderNumber(String id) {
    return 'Commande #$id';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count produits',
      one: '1 produit',
    );
    return '$_temp0';
  }

  @override
  String moreItems(int count) {
    return '+ $count de plus...';
  }

  @override
  String total(String amount) {
    return 'Total : €$amount';
  }

  @override
  String get changeStatus => 'Changer le statut';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteOrder => 'Supprimer la Commande';

  @override
  String get deleteOrderConfirmation =>
      'Êtes-vous sûr de vouloir supprimer cette commande ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get filterByStatus => 'Filtrer par statut';

  @override
  String get all => 'Tous';

  @override
  String get totalOrders => 'Total Commandes';

  @override
  String get totalValue => 'Valeur Totale';

  @override
  String get noOrdersWithStatus => 'Aucune commande avec ce statut';

  @override
  String get noOrdersYet => 'Vous n\'avez pas encore de commandes';

  @override
  String get tryDifferentFilter =>
      'Essayez un filtre différent ou consultez toutes les commandes';

  @override
  String get firstOrderMessage =>
      'Lorsque vous passerez votre première commande, elle apparaîtra ici';

  @override
  String get clearFilter => 'Effacer le filtre';

  @override
  String get goToShop => 'Aller à la boutique';

  @override
  String get orderDetails => 'Détails de la Commande';

  @override
  String get customer => 'Client';

  @override
  String get email => 'Email';

  @override
  String get date => 'Date';

  @override
  String get notes => 'Notes';

  @override
  String get subtotal => 'Sous-total';

  @override
  String get pending => 'En attente';

  @override
  String get processing => 'En cours';

  @override
  String get shipped => 'Expédié';

  @override
  String get delivered => 'Livré';

  @override
  String get cancelled => 'Annulé';

  @override
  String get sureYouWantToLeave => 'Êtes-vous sûr de vouloir partir ?';

  @override
  String get almostDoneDescription =>
      'Votre chien est très proche de commencer à apprécier sa nourriture comme jamais.';

  @override
  String get continueLater => 'Continuer plus tard';

  @override
  String get comeOnStay => 'Allez, je reste';

  @override
  String aboutToChangeLife(String petName) {
    return 'Vous êtes sur le point de changer la vie de $petName';
  }

  @override
  String specificNeedsDescription(String petName) {
    return 'En raison des besoins spécifiques de $petName, voici à quoi ressemble son plan personnalisé.';
  }

  @override
  String get yourDog => 'Votre chien';

  @override
  String dailyAmount(String amount) {
    return '$amount/jour';
  }

  @override
  String pricePerDay(String price) {
    return 'Prix : $price €/jour';
  }

  @override
  String packetsDescription(String packets) {
    return '$packets sachets, 1 sachet/jour';
  }

  @override
  String get recommended => 'RECOMMANDÉ';

  @override
  String get hisPlan => 'Son plan : ';

  @override
  String get price => 'Prix : ';

  @override
  String get perDay => '/jour';

  @override
  String get trial14Days => 'Essai de 14 jours';

  @override
  String discountLabel(int discount) {
    return '-$discount% 🎉';
  }

  @override
  String get observePositiveChanges =>
      'Observent des changements positifs grâce au changement d\'alimentation';

  @override
  String get noticeDigestionImprovements =>
      'Remarquent des améliorations dans la digestion';

  @override
  String get healthierShinerCoat => 'Montrent un pelage plus sain et brillant';

  @override
  String receiveMenuWherever(String petName) {
    return 'Recevez le menu de $petName où vous voulez';
  }

  @override
  String get nextAvailableDate => 'Prochaine date disponible';

  @override
  String get edit => 'Modifier';

  @override
  String get deliveryData => 'Données de livraison';

  @override
  String get name => 'Nom';

  @override
  String get myNameIs => 'Mon nom est...';

  @override
  String get mySurnameIs => 'Mon nom de famille est...';

  @override
  String get fullAddress =>
      'Adresse complète (ex.: Rue de Finisterre, 5, 3ème)';

  @override
  String get myAddressIs => 'Mon adresse est...';

  @override
  String get locality => 'Localité / Ville';

  @override
  String get myLocalityIs => 'Ma localité est...';

  @override
  String get postalCode => 'Code postal';

  @override
  String get myPostalCodeIs => 'Mon code postal est...';

  @override
  String get country => 'Pays';

  @override
  String get spain => 'Espagne';

  @override
  String get paymentData => 'Données de paiement';

  @override
  String get finalizeDogfyDiet => 'Finaliser Dogfy Diet';

  @override
  String get card => 'Carte';

  @override
  String get cardNumber => 'Numéro de carte';

  @override
  String get securityCode => 'Code de sécurité';

  @override
  String needsDaily(String petName, String amount) {
    return '$petName a besoin de $amount/jour';
  }

  @override
  String trialPeriodPrice(String price) {
    return 'Une fois la période d\'essai terminée, le prix de votre plan mensuel sera de $price €/semaine';
  }

  @override
  String get promoCodeQuestion => 'Avez-vous un code promotionnel ?';

  @override
  String get orderContents => 'Ce que contient votre commande';

  @override
  String get chickenMenu => 'Menu poulet';

  @override
  String get turkeyMenu => 'Menu dinde';

  @override
  String get salmonMenu => 'Menu saumon';

  @override
  String get beefMenu => 'Menu bœuf';

  @override
  String get welcomePack => 'Pack de bienvenue';

  @override
  String get free => 'GRATUIT';

  @override
  String get freeShipping => 'Livraison gratuite';

  @override
  String get securePayment => 'Paiement sécurisé';

  @override
  String get flexibility => 'Flexibilité';

  @override
  String activityLevelQuestion(String petName) {
    return 'Quel est le niveau d\'activité de $petName ? 🏃‍♀️';
  }

  @override
  String get chooseActivityLevel =>
      'Choisissez le niveau d\'activité qui le décrit le mieux.';

  @override
  String get selectOptionForDescription =>
      'Sélectionnez une option pour voir la description';

  @override
  String get lowActivityDescription =>
      '🐕 Chien tapis : promenades quotidiennes de moins d\'1h. Ce qu\'il aime le plus, c\'est faire une bonne sieste 😴 et rester bien tranquille.';

  @override
  String get mediumActivityDescription =>
      '🐕 Chien zen : promenades quotidiennes de 1 à 2h. Sait profiter de bonnes balades, mais sait aussi quand se reposer 😊';

  @override
  String get highActivityDescription =>
      '🐕 Chien tornade : promenades quotidiennes de plus de 2h. Quel tourbillon d\'énergie ! 💪';

  @override
  String silhouetteQuestion(String petName) {
    return 'Quelle silhouette représente le mieux $petName ?';
  }

  @override
  String get selectSimilarFigure =>
      'Sélectionnez la figure qui ressemble le plus en termes de poids et de forme 🐕';

  @override
  String weightDescription(String petName) {
    return 'Le poids de $petName est à peu près de';
  }

  @override
  String get kg => 'kg';

  @override
  String get whyImportant => 'Pourquoi est-ce important ? 🤔';

  @override
  String get thinSilhouetteDescription =>
      'Parfait mannequin : La taille est visible et ses côtes sont faciles à palper.';

  @override
  String get normalSilhouetteDescription =>
      'À son poids idéal : Il paraît proportionné et en bonne santé.';

  @override
  String get overweightSilhouetteDescription =>
      'Un peu dodu : On remarque un léger surpoids, mais rien de grave.';

  @override
  String birthDateQuestion(String petName) {
    return 'Quand $petName est-il né ?';
  }

  @override
  String get calorieNeedsVaryByAge =>
      'Les besoins caloriques varient selon l\'âge de votre chien, mais nous nous adapterons parfaitement à son stade de vie 😊';

  @override
  String get january => 'Janvier';

  @override
  String get february => 'Février';

  @override
  String get march => 'Mars';

  @override
  String get april => 'Avril';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juin';

  @override
  String get july => 'Juillet';

  @override
  String get august => 'Août';

  @override
  String get september => 'Septembre';

  @override
  String get october => 'Octobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Décembre';

  @override
  String get breedQuestion => 'Quelle est la race de votre petit ?';

  @override
  String get searchBreedPlaceholder => 'Recherchez ou écrivez sa race 🐶';

  @override
  String get foodCriticQuestion =>
      'Quel critique gastronomique est votre chien ? 🍽️ 🐕';

  @override
  String chooseFoodOption(String petName) {
    return 'Choisissez l\'option qui décrit le mieux $petName';
  }

  @override
  String get selective => 'Sélectif';

  @override
  String get gourmet => 'Gourmet';

  @override
  String get eatsEverything => 'Mange tout';

  @override
  String get selectiveDescription =>
      'Le sélectif : très exigeant avec la nourriture, ne mange que ce qu\'il aime vraiment 🤔';

  @override
  String get gourmetDescription =>
      'Le gourmet : adore essayer de nouvelles saveurs, mais ne se contente pas de n\'importe quoi 🤤';

  @override
  String get eatsEverythingDescription =>
      'Mange tout : aucune nourriture ne lui résiste, toujours prêt à essayer 😋';

  @override
  String healthConditionsQuestion(String petName) {
    return '$petName a-t-il une pathologie ?';
  }

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get selectedPathologies => 'Pathologies sélectionnées :';

  @override
  String get everyDogIsAWorld => 'Chaque chien est un monde 🌍';

  @override
  String get dontWorryAdaptMenu =>
      'Ne vous inquiétez pas ! 🧡 Nous adapterons notre menu à son cas, dans la mesure du possible. Si la pathologie de votre chien n\'apparaît pas dans le formulaire, envoyez un email à nutritionistes@dogfydiet.com.';

  @override
  String get selectPathology => 'Sélectionnez une pathologie';

  @override
  String get allergiesIntolerances => 'Allergies et intolérances alimentaires';

  @override
  String get sensitiveDigestion => 'Digestion sensible';

  @override
  String get skinProblems => 'Problèmes de peau';

  @override
  String get jointProblems => 'Problèmes articulaires';

  @override
  String get dentalProblems => 'Problèmes dentaires';

  @override
  String get diabetes => 'Diabète';

  @override
  String get kidneyProblems => 'Problèmes rénaux';

  @override
  String get heartProblems => 'Problèmes cardiaques';

  @override
  String get overweight => 'Surpoids';

  @override
  String get underweight => 'Sous-poids';

  @override
  String specialMenuAlmostReady(String petName) {
    return 'Le menu spécial pour $petName est presque prêt !';
  }

  @override
  String get acceptTermsMessage =>
      'En continuant, votre progression sera sauvegardée et vous accepterez les termes et conditions et la politique de confidentialité pour recevoir les meilleures recommandations nutritionnelles. 🧡';

  @override
  String wantToKnowPet(String petName) {
    return 'Nous voulons connaître $petName !';
  }

  @override
  String get male => 'Mâle';

  @override
  String get female => 'Femelle';

  @override
  String get isNeutered => 'Est-il stérilisé ?';

  @override
  String isPregnantOrLactating(String petName) {
    return '$petName est-elle gestante ou allaitante ?';
  }

  @override
  String get yourFemale => 'Votre femelle';

  @override
  String get afterNeuteringAdjustments =>
      'Après la stérilisation, des ajustements de ration sont nécessaires, car le chien a généralement une dépense calorique moindre.';

  @override
  String petNameQuestion(String breed) {
    return 'Comment s\'appelle votre $breed ?';
  }

  @override
  String get dog => 'chien';

  @override
  String get myDogIsCalled => 'Mon chien s\'appelle...';

  @override
  String excitementImproveLife(String breed) {
    return 'Quelle excitation ! 🥳 Vous êtes sur le point d\'améliorer la vie de votre $breed grâce à une alimentation 100% naturelle.';
  }

  @override
  String puppyExclamation(String petName) {
    return '$petName est un chiot ! 🥰';
  }

  @override
  String get importantKnowCurrentWeight =>
      'Il est important de connaître son poids actuel pour calculer sa ration idéale.';

  @override
  String get knowPuppyWeightFundamental =>
      'Connaître le poids de votre chiot est fondamental pour adapter le plan d\'alimentation à son stade de développement.';

  @override
  String get back => 'Retour';

  @override
  String get continueButton => 'Continuer';

  @override
  String get useCurrentLocation => 'Utiliser la position actuelle';

  @override
  String get detectingLocation => 'Détection de la position...';

  @override
  String get locationPermissionRequired => 'Permission de localisation requise';

  @override
  String get locationPermissionDenied => 'Permission de localisation refusée';

  @override
  String get locationPermissionPermanentlyDenied =>
      'Permission de localisation refusée définitivement';

  @override
  String get enableLocationInSettings =>
      'Veuillez activer l\'accès à la localisation dans les paramètres';

  @override
  String get locationServiceDisabled =>
      'Le service de localisation est désactivé';

  @override
  String get enableLocationService =>
      'Veuillez activer le service de localisation';

  @override
  String get locationDetectionFailed => 'Échec de la détection de position';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get allowLocationAccess =>
      'Autorisez l\'accès à la localisation pour remplir automatiquement votre adresse';

  @override
  String get locationDetected => 'Position détectée avec succès';

  @override
  String get unableToGetAddress =>
      'Impossible d\'obtenir l\'adresse à partir de la position';

  @override
  String get checkInternetConnection =>
      'Veuillez vérifier votre connexion internet';

  @override
  String get purchaseSuccess => 'Achat réalisé correctement';

  @override
  String get purchaseSuccessMessage =>
      'Votre achat a été traité avec succès. Bienvenue chez Dogfy Diet !';
}
