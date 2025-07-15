import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it')
  ];

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @personalizeExperience.
  ///
  /// In en, this message translates to:
  /// **'Personalize your experience'**
  String get personalizeExperience;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @lightModeActive.
  ///
  /// In en, this message translates to:
  /// **'Light interface activated'**
  String get lightModeActive;

  /// No description provided for @darkModeActive.
  ///
  /// In en, this message translates to:
  /// **'Dark interface activated'**
  String get darkModeActive;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @configuration.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get configuration;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @manageAlerts.
  ///
  /// In en, this message translates to:
  /// **'Manage your alerts'**
  String get manageAlerts;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @dataConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Data settings'**
  String get dataConfiguration;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// No description provided for @putRealFoodInBowl.
  ///
  /// In en, this message translates to:
  /// **'Put real food in your dog\'s bowl'**
  String get putRealFoodInBowl;

  /// No description provided for @naturalFoodDescription.
  ///
  /// In en, this message translates to:
  /// **'Natural food for dogs, complete and balanced. Made by nutritionists'**
  String get naturalFoodDescription;

  /// No description provided for @whatBreedIsYourDog.
  ///
  /// In en, this message translates to:
  /// **'What breed is your furry friend?'**
  String get whatBreedIsYourDog;

  /// No description provided for @createMenu.
  ///
  /// In en, this message translates to:
  /// **'Create their menu'**
  String get createMenu;

  /// No description provided for @improveDigestion.
  ///
  /// In en, this message translates to:
  /// **'Improve digestion'**
  String get improveDigestion;

  /// No description provided for @shinierCoat.
  ///
  /// In en, this message translates to:
  /// **'Shinier coat'**
  String get shinierCoat;

  /// No description provided for @moreEnergyVitality.
  ///
  /// In en, this message translates to:
  /// **'More energy and vitality'**
  String get moreEnergyVitality;

  /// No description provided for @naturalIngredients.
  ///
  /// In en, this message translates to:
  /// **'Natural ingredients'**
  String get naturalIngredients;

  /// No description provided for @ourProducts.
  ///
  /// In en, this message translates to:
  /// **'Our products'**
  String get ourProducts;

  /// No description provided for @premiumMenus.
  ///
  /// In en, this message translates to:
  /// **'Premium Menus'**
  String get premiumMenus;

  /// No description provided for @completeDaily.
  ///
  /// In en, this message translates to:
  /// **'Complete daily food'**
  String get completeDaily;

  /// No description provided for @naturalSnacks.
  ///
  /// In en, this message translates to:
  /// **'Natural Snacks'**
  String get naturalSnacks;

  /// No description provided for @healthyTreats.
  ///
  /// In en, this message translates to:
  /// **'Healthy treats'**
  String get healthyTreats;

  /// No description provided for @supplements.
  ///
  /// In en, this message translates to:
  /// **'Supplements'**
  String get supplements;

  /// No description provided for @specificCare.
  ///
  /// In en, this message translates to:
  /// **'Specific care'**
  String get specificCare;

  /// No description provided for @accessories.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get accessories;

  /// No description provided for @everythingForYourDog.
  ///
  /// In en, this message translates to:
  /// **'Everything for your dog'**
  String get everythingForYourDog;

  /// No description provided for @featuredProducts.
  ///
  /// In en, this message translates to:
  /// **'Featured products'**
  String get featuredProducts;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @premiumChickenMenu.
  ///
  /// In en, this message translates to:
  /// **'Premium Chicken Menu'**
  String get premiumChickenMenu;

  /// No description provided for @richInProteins.
  ///
  /// In en, this message translates to:
  /// **'Rich in proteins and vegetables'**
  String get richInProteins;

  /// No description provided for @premiumSalmonMenu.
  ///
  /// In en, this message translates to:
  /// **'Premium Salmon Menu'**
  String get premiumSalmonMenu;

  /// No description provided for @withOmega3.
  ///
  /// In en, this message translates to:
  /// **'With Omega-3 and brown rice'**
  String get withOmega3;

  /// No description provided for @premiumBeefMenu.
  ///
  /// In en, this message translates to:
  /// **'Premium Beef Menu'**
  String get premiumBeefMenu;

  /// No description provided for @withMediterranean.
  ///
  /// In en, this message translates to:
  /// **'With Mediterranean vegetables'**
  String get withMediterranean;

  /// No description provided for @whyChooseDogfy.
  ///
  /// In en, this message translates to:
  /// **'Why choose Dogfy Diet?'**
  String get whyChooseDogfy;

  /// No description provided for @scientificSupport.
  ///
  /// In en, this message translates to:
  /// **'Scientific support'**
  String get scientificSupport;

  /// No description provided for @developedByVets.
  ///
  /// In en, this message translates to:
  /// **'Developed by veterinarians and nutritionists'**
  String get developedByVets;

  /// No description provided for @homeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Home delivery'**
  String get homeDelivery;

  /// No description provided for @receiveFreshFood.
  ///
  /// In en, this message translates to:
  /// **'Receive fresh food at your door'**
  String get receiveFreshFood;

  /// No description provided for @personalized.
  ///
  /// In en, this message translates to:
  /// **'Personalized'**
  String get personalized;

  /// No description provided for @menusAdapted.
  ///
  /// In en, this message translates to:
  /// **'Menus adapted to your dog\'s needs'**
  String get menusAdapted;

  /// No description provided for @selectBreed.
  ///
  /// In en, this message translates to:
  /// **'Select your dog\'s breed'**
  String get selectBreed;

  /// No description provided for @goldenRetriever.
  ///
  /// In en, this message translates to:
  /// **'Golden Retriever'**
  String get goldenRetriever;

  /// No description provided for @labrador.
  ///
  /// In en, this message translates to:
  /// **'Labrador'**
  String get labrador;

  /// No description provided for @germanShepherd.
  ///
  /// In en, this message translates to:
  /// **'German Shepherd'**
  String get germanShepherd;

  /// No description provided for @frenchBulldog.
  ///
  /// In en, this message translates to:
  /// **'French Bulldog'**
  String get frenchBulldog;

  /// No description provided for @borderCollie.
  ///
  /// In en, this message translates to:
  /// **'Border Collie'**
  String get borderCollie;

  /// No description provided for @siberianHusky.
  ///
  /// In en, this message translates to:
  /// **'Siberian Husky'**
  String get siberianHusky;

  /// No description provided for @chihuahua.
  ///
  /// In en, this message translates to:
  /// **'Chihuahua'**
  String get chihuahua;

  /// No description provided for @yorkshireTerrier.
  ///
  /// In en, this message translates to:
  /// **'Yorkshire Terrier'**
  String get yorkshireTerrier;

  /// No description provided for @boxer.
  ///
  /// In en, this message translates to:
  /// **'Boxer'**
  String get boxer;

  /// No description provided for @mixedBreed.
  ///
  /// In en, this message translates to:
  /// **'Mixed breed'**
  String get mixedBreed;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @manageAndReviewOrders.
  ///
  /// In en, this message translates to:
  /// **'Manage and review your orders'**
  String get manageAndReviewOrders;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order #{id}'**
  String orderNumber(String id);

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 product} other{{count} products}}'**
  String itemsCount(int count);

  /// No description provided for @moreItems.
  ///
  /// In en, this message translates to:
  /// **'+ {count} more...'**
  String moreItems(int count);

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total: €{amount}'**
  String total(String amount);

  /// No description provided for @changeStatus.
  ///
  /// In en, this message translates to:
  /// **'Change status'**
  String get changeStatus;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteOrder.
  ///
  /// In en, this message translates to:
  /// **'Delete Order'**
  String get deleteOrder;

  /// No description provided for @deleteOrderConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this order?'**
  String get deleteOrderConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @filterByStatus.
  ///
  /// In en, this message translates to:
  /// **'Filter by status'**
  String get filterByStatus;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get totalOrders;

  /// No description provided for @totalValue.
  ///
  /// In en, this message translates to:
  /// **'Total Value'**
  String get totalValue;

  /// No description provided for @noOrdersWithStatus.
  ///
  /// In en, this message translates to:
  /// **'No orders with this status'**
  String get noOrdersWithStatus;

  /// No description provided for @noOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any orders yet'**
  String get noOrdersYet;

  /// No description provided for @tryDifferentFilter.
  ///
  /// In en, this message translates to:
  /// **'Try a different filter or check all orders'**
  String get tryDifferentFilter;

  /// No description provided for @firstOrderMessage.
  ///
  /// In en, this message translates to:
  /// **'When you place your first order, it will appear here'**
  String get firstOrderMessage;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clearFilter;

  /// No description provided for @goToShop.
  ///
  /// In en, this message translates to:
  /// **'Go to shop'**
  String get goToShop;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @shipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get shipped;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
