// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get preferences => 'Preferences';

  @override
  String get personalizeExperience => 'Personalize your experience';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get lightModeActive => 'Light interface activated';

  @override
  String get darkModeActive => 'Dark interface activated';

  @override
  String get language => 'Language';

  @override
  String get appLanguage => 'App language';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get configuration => 'Settings';

  @override
  String get notifications => 'Notifications';

  @override
  String get manageAlerts => 'Manage your alerts';

  @override
  String get privacy => 'Privacy';

  @override
  String get dataConfiguration => 'Data settings';

  @override
  String get about => 'About';

  @override
  String get version => 'Version 1.0.0';

  @override
  String get putRealFoodInBowl => 'Put real food in your dog\'s bowl';

  @override
  String get naturalFoodDescription =>
      'Natural food for dogs, complete and balanced. Made by nutritionists';

  @override
  String get whatBreedIsYourDog => 'What breed is your furry friend?';

  @override
  String get createMenu => 'Create their menu';

  @override
  String get improveDigestion => 'Improve digestion';

  @override
  String get shinierCoat => 'Shinier coat';

  @override
  String get moreEnergyVitality => 'More energy and vitality';

  @override
  String get naturalIngredients => 'Natural ingredients';

  @override
  String get ourProducts => 'Our products';

  @override
  String get premiumMenus => 'Premium Menus';

  @override
  String get completeDaily => 'Complete daily food';

  @override
  String get naturalSnacks => 'Natural Snacks';

  @override
  String get healthyTreats => 'Healthy treats';

  @override
  String get supplements => 'Supplements';

  @override
  String get specificCare => 'Specific care';

  @override
  String get accessories => 'Accessories';

  @override
  String get everythingForYourDog => 'Everything for your dog';

  @override
  String get featuredProducts => 'Featured products';

  @override
  String get viewAll => 'View all';

  @override
  String get premiumChickenMenu => 'Premium Chicken Menu';

  @override
  String get richInProteins => 'Rich in proteins and vegetables';

  @override
  String get premiumSalmonMenu => 'Premium Salmon Menu';

  @override
  String get withOmega3 => 'With Omega-3 and brown rice';

  @override
  String get premiumBeefMenu => 'Premium Beef Menu';

  @override
  String get withMediterranean => 'With Mediterranean vegetables';

  @override
  String get whyChooseDogfy => 'Why choose Dogfy Diet?';

  @override
  String get scientificSupport => 'Scientific support';

  @override
  String get developedByVets => 'Developed by veterinarians and nutritionists';

  @override
  String get homeDelivery => 'Home delivery';

  @override
  String get receiveFreshFood => 'Receive fresh food at your door';

  @override
  String get personalized => 'Personalized';

  @override
  String get menusAdapted => 'Menus adapted to your dog\'s needs';

  @override
  String get selectBreed => 'Select your dog\'s breed';

  @override
  String get goldenRetriever => 'Golden Retriever';

  @override
  String get labrador => 'Labrador';

  @override
  String get germanShepherd => 'German Shepherd';

  @override
  String get frenchBulldog => 'French Bulldog';

  @override
  String get borderCollie => 'Border Collie';

  @override
  String get siberianHusky => 'Siberian Husky';

  @override
  String get chihuahua => 'Chihuahua';

  @override
  String get yorkshireTerrier => 'Yorkshire Terrier';

  @override
  String get boxer => 'Boxer';

  @override
  String get mixedBreed => 'Mixed breed';

  @override
  String get other => 'Other';

  @override
  String get myOrders => 'My Orders';

  @override
  String get manageAndReviewOrders => 'Manage and review your orders';

  @override
  String orderNumber(String id) {
    return 'Order #$id';
  }

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count products',
      one: '1 product',
    );
    return '$_temp0';
  }

  @override
  String moreItems(int count) {
    return '+ $count more...';
  }

  @override
  String total(String amount) {
    return 'Total: €$amount';
  }

  @override
  String get changeStatus => 'Change status';

  @override
  String get delete => 'Delete';

  @override
  String get deleteOrder => 'Delete Order';

  @override
  String get deleteOrderConfirmation =>
      'Are you sure you want to delete this order?';

  @override
  String get cancel => 'Cancel';

  @override
  String get filterByStatus => 'Filter by status';

  @override
  String get all => 'All';

  @override
  String get totalOrders => 'Total Orders';

  @override
  String get totalValue => 'Total Value';

  @override
  String get noOrdersWithStatus => 'No orders with this status';

  @override
  String get noOrdersYet => 'You don\'t have any orders yet';

  @override
  String get tryDifferentFilter => 'Try a different filter or check all orders';

  @override
  String get firstOrderMessage =>
      'When you place your first order, it will appear here';

  @override
  String get clearFilter => 'Clear filter';

  @override
  String get goToShop => 'Go to shop';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get customer => 'Customer';

  @override
  String get email => 'Email';

  @override
  String get date => 'Date';

  @override
  String get notes => 'Notes';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get pending => 'Pending';

  @override
  String get processing => 'Processing';

  @override
  String get shipped => 'Shipped';

  @override
  String get delivered => 'Delivered';

  @override
  String get cancelled => 'Cancelled';
}
