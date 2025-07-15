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
}
