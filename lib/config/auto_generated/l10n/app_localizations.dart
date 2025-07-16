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

  /// No description provided for @sureYouWantToLeave.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave?'**
  String get sureYouWantToLeave;

  /// No description provided for @almostDoneDescription.
  ///
  /// In en, this message translates to:
  /// **'Your dog is very close to starting to enjoy their food like never before.'**
  String get almostDoneDescription;

  /// No description provided for @continueLater.
  ///
  /// In en, this message translates to:
  /// **'Continue later'**
  String get continueLater;

  /// No description provided for @comeOnStay.
  ///
  /// In en, this message translates to:
  /// **'Come on, I\'ll stay'**
  String get comeOnStay;

  /// No description provided for @aboutToChangeLife.
  ///
  /// In en, this message translates to:
  /// **'You\'re about to change {petName}\'s life'**
  String aboutToChangeLife(String petName);

  /// No description provided for @specificNeedsDescription.
  ///
  /// In en, this message translates to:
  /// **'Due to {petName}\'s specific needs, this is how their personalized plan looks.'**
  String specificNeedsDescription(String petName);

  /// No description provided for @yourDog.
  ///
  /// In en, this message translates to:
  /// **'Your dog'**
  String get yourDog;

  /// No description provided for @dailyAmount.
  ///
  /// In en, this message translates to:
  /// **'{amount}/day'**
  String dailyAmount(String amount);

  /// No description provided for @pricePerDay.
  ///
  /// In en, this message translates to:
  /// **'Price: €{price}/day'**
  String pricePerDay(String price);

  /// No description provided for @packetsDescription.
  ///
  /// In en, this message translates to:
  /// **'{packets} packets, 1 packet/day'**
  String packetsDescription(String packets);

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'RECOMMENDED'**
  String get recommended;

  /// No description provided for @hisPlan.
  ///
  /// In en, this message translates to:
  /// **'Their plan: '**
  String get hisPlan;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price: '**
  String get price;

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'/day'**
  String get perDay;

  /// No description provided for @trial14Days.
  ///
  /// In en, this message translates to:
  /// **'14-day trial'**
  String get trial14Days;

  /// No description provided for @discountLabel.
  ///
  /// In en, this message translates to:
  /// **'-{discount}% 🎉'**
  String discountLabel(int discount);

  /// No description provided for @observePositiveChanges.
  ///
  /// In en, this message translates to:
  /// **'Observe positive changes from the dietary change'**
  String get observePositiveChanges;

  /// No description provided for @noticeDigestionImprovements.
  ///
  /// In en, this message translates to:
  /// **'Notice improvements in digestion'**
  String get noticeDigestionImprovements;

  /// No description provided for @healthierShinerCoat.
  ///
  /// In en, this message translates to:
  /// **'Show a healthier and shinier coat'**
  String get healthierShinerCoat;

  /// No description provided for @receiveMenuWherever.
  ///
  /// In en, this message translates to:
  /// **'Receive {petName}\'s menu wherever you want'**
  String receiveMenuWherever(String petName);

  /// No description provided for @nextAvailableDate.
  ///
  /// In en, this message translates to:
  /// **'Next available date'**
  String get nextAvailableDate;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @deliveryData.
  ///
  /// In en, this message translates to:
  /// **'Delivery details'**
  String get deliveryData;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @myNameIs.
  ///
  /// In en, this message translates to:
  /// **'My name is...'**
  String get myNameIs;

  /// No description provided for @mySurnameIs.
  ///
  /// In en, this message translates to:
  /// **'My surname is...'**
  String get mySurnameIs;

  /// No description provided for @fullAddress.
  ///
  /// In en, this message translates to:
  /// **'Full address (e.g.: Finisterre Street, 5, 3rd)'**
  String get fullAddress;

  /// No description provided for @myAddressIs.
  ///
  /// In en, this message translates to:
  /// **'My address is...'**
  String get myAddressIs;

  /// No description provided for @locality.
  ///
  /// In en, this message translates to:
  /// **'Locality / City'**
  String get locality;

  /// No description provided for @myLocalityIs.
  ///
  /// In en, this message translates to:
  /// **'My locality is...'**
  String get myLocalityIs;

  /// No description provided for @postalCode.
  ///
  /// In en, this message translates to:
  /// **'Postal code'**
  String get postalCode;

  /// No description provided for @myPostalCodeIs.
  ///
  /// In en, this message translates to:
  /// **'My postal code is...'**
  String get myPostalCodeIs;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @spain.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get spain;

  /// No description provided for @paymentData.
  ///
  /// In en, this message translates to:
  /// **'Payment details'**
  String get paymentData;

  /// No description provided for @finalizeDogfyDiet.
  ///
  /// In en, this message translates to:
  /// **'Complete Dogfy Diet'**
  String get finalizeDogfyDiet;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @securityCode.
  ///
  /// In en, this message translates to:
  /// **'Security code'**
  String get securityCode;

  /// No description provided for @needsDaily.
  ///
  /// In en, this message translates to:
  /// **'{petName} needs {amount}/day'**
  String needsDaily(String petName, String amount);

  /// No description provided for @trialPeriodPrice.
  ///
  /// In en, this message translates to:
  /// **'Once the trial period ends, your monthly plan price will be €{price}/week'**
  String trialPeriodPrice(String price);

  /// No description provided for @promoCodeQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you have a promotional code?'**
  String get promoCodeQuestion;

  /// No description provided for @orderContents.
  ///
  /// In en, this message translates to:
  /// **'What your order contains'**
  String get orderContents;

  /// No description provided for @chickenMenu.
  ///
  /// In en, this message translates to:
  /// **'Chicken menu'**
  String get chickenMenu;

  /// No description provided for @turkeyMenu.
  ///
  /// In en, this message translates to:
  /// **'Turkey menu'**
  String get turkeyMenu;

  /// No description provided for @salmonMenu.
  ///
  /// In en, this message translates to:
  /// **'Salmon menu'**
  String get salmonMenu;

  /// No description provided for @beefMenu.
  ///
  /// In en, this message translates to:
  /// **'Beef menu'**
  String get beefMenu;

  /// No description provided for @welcomePack.
  ///
  /// In en, this message translates to:
  /// **'Welcome pack'**
  String get welcomePack;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get free;

  /// No description provided for @freeShipping.
  ///
  /// In en, this message translates to:
  /// **'Free shipping'**
  String get freeShipping;

  /// No description provided for @securePayment.
  ///
  /// In en, this message translates to:
  /// **'Secure payment'**
  String get securePayment;

  /// No description provided for @flexibility.
  ///
  /// In en, this message translates to:
  /// **'Flexibility'**
  String get flexibility;

  /// No description provided for @activityLevelQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is {petName}\'s activity level? 🏃‍♀️'**
  String activityLevelQuestion(String petName);

  /// No description provided for @chooseActivityLevel.
  ///
  /// In en, this message translates to:
  /// **'Choose the activity level that best describes them.'**
  String get chooseActivityLevel;

  /// No description provided for @selectOptionForDescription.
  ///
  /// In en, this message translates to:
  /// **'Select an option to see the description'**
  String get selectOptionForDescription;

  /// No description provided for @lowActivityDescription.
  ///
  /// In en, this message translates to:
  /// **'🐕 Carpet dog: daily walks of less than 1h. What they love most is taking a good nap 😴 and staying very quiet.'**
  String get lowActivityDescription;

  /// No description provided for @mediumActivityDescription.
  ///
  /// In en, this message translates to:
  /// **'🐕 Zen dog: daily walks of 1 to 2h. Enjoys good walks, but also knows when to rest 😊'**
  String get mediumActivityDescription;

  /// No description provided for @highActivityDescription.
  ///
  /// In en, this message translates to:
  /// **'🐕 Earthquake dog: daily walks of more than 2h. What a whirlwind of energy! 💪'**
  String get highActivityDescription;

  /// No description provided for @silhouetteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which silhouette best represents {petName}?'**
  String silhouetteQuestion(String petName);

  /// No description provided for @selectSimilarFigure.
  ///
  /// In en, this message translates to:
  /// **'Select the figure that most resembles their weight and shape 🐕'**
  String get selectSimilarFigure;

  /// No description provided for @weightDescription.
  ///
  /// In en, this message translates to:
  /// **'The weight of {petName} is approximately'**
  String weightDescription(String petName);

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @whyImportant.
  ///
  /// In en, this message translates to:
  /// **'Why is it important? 🤔'**
  String get whyImportant;

  /// No description provided for @thinSilhouetteDescription.
  ///
  /// In en, this message translates to:
  /// **'Perfect figure: The waist is visible and ribs are easy to feel.'**
  String get thinSilhouetteDescription;

  /// No description provided for @normalSilhouetteDescription.
  ///
  /// In en, this message translates to:
  /// **'At ideal weight: Looks proportioned and healthy.'**
  String get normalSilhouetteDescription;

  /// No description provided for @overweightSilhouetteDescription.
  ///
  /// In en, this message translates to:
  /// **'A bit chubby: Some overweight is noticeable, but nothing serious.'**
  String get overweightSilhouetteDescription;

  /// No description provided for @birthDateQuestion.
  ///
  /// In en, this message translates to:
  /// **'When was {petName} born?'**
  String birthDateQuestion(String petName);

  /// No description provided for @calorieNeedsVaryByAge.
  ///
  /// In en, this message translates to:
  /// **'Caloric needs vary according to your dog\'s age, but we will adapt perfectly to their life stage 😊'**
  String get calorieNeedsVaryByAge;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @breedQuestion.
  ///
  /// In en, this message translates to:
  /// **'What breed is your little one?'**
  String get breedQuestion;

  /// No description provided for @searchBreedPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search or write their breed 🐶'**
  String get searchBreedPlaceholder;

  /// No description provided for @foodCriticQuestion.
  ///
  /// In en, this message translates to:
  /// **'What kind of food critic is your dog? 🍽️ 🐕'**
  String get foodCriticQuestion;

  /// No description provided for @chooseFoodOption.
  ///
  /// In en, this message translates to:
  /// **'Choose the option that best describes {petName}'**
  String chooseFoodOption(String petName);

  /// No description provided for @selective.
  ///
  /// In en, this message translates to:
  /// **'Selective'**
  String get selective;

  /// No description provided for @gourmet.
  ///
  /// In en, this message translates to:
  /// **'Gourmet'**
  String get gourmet;

  /// No description provided for @eatsEverything.
  ///
  /// In en, this message translates to:
  /// **'Eats everything'**
  String get eatsEverything;

  /// No description provided for @selectiveDescription.
  ///
  /// In en, this message translates to:
  /// **'The selective one: very demanding with food, only eats what they really like 🤔'**
  String get selectiveDescription;

  /// No description provided for @gourmetDescription.
  ///
  /// In en, this message translates to:
  /// **'The gourmet: loves trying new flavors, but doesn\'t settle for just anything 🤤'**
  String get gourmetDescription;

  /// No description provided for @eatsEverythingDescription.
  ///
  /// In en, this message translates to:
  /// **'Eats everything: no food can resist them, always ready to try 😋'**
  String get eatsEverythingDescription;

  /// No description provided for @healthConditionsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Does {petName} have any pathology?'**
  String healthConditionsQuestion(String petName);

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @selectedPathologies.
  ///
  /// In en, this message translates to:
  /// **'Selected pathologies:'**
  String get selectedPathologies;

  /// No description provided for @everyDogIsAWorld.
  ///
  /// In en, this message translates to:
  /// **'Every dog is a world 🌍'**
  String get everyDogIsAWorld;

  /// No description provided for @dontWorryAdaptMenu.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry! 🧡 We will adapt our menu to their case, whenever possible. If your dog\'s pathology doesn\'t appear in the form, send an email to nutritionists@dogfydiet.com.'**
  String get dontWorryAdaptMenu;

  /// No description provided for @selectPathology.
  ///
  /// In en, this message translates to:
  /// **'Select a pathology'**
  String get selectPathology;

  /// No description provided for @allergiesIntolerances.
  ///
  /// In en, this message translates to:
  /// **'Allergies and food intolerances'**
  String get allergiesIntolerances;

  /// No description provided for @sensitiveDigestion.
  ///
  /// In en, this message translates to:
  /// **'Sensitive digestion'**
  String get sensitiveDigestion;

  /// No description provided for @skinProblems.
  ///
  /// In en, this message translates to:
  /// **'Skin problems'**
  String get skinProblems;

  /// No description provided for @jointProblems.
  ///
  /// In en, this message translates to:
  /// **'Joint problems'**
  String get jointProblems;

  /// No description provided for @dentalProblems.
  ///
  /// In en, this message translates to:
  /// **'Dental problems'**
  String get dentalProblems;

  /// No description provided for @diabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get diabetes;

  /// No description provided for @kidneyProblems.
  ///
  /// In en, this message translates to:
  /// **'Kidney problems'**
  String get kidneyProblems;

  /// No description provided for @heartProblems.
  ///
  /// In en, this message translates to:
  /// **'Heart problems'**
  String get heartProblems;

  /// No description provided for @overweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get overweight;

  /// No description provided for @underweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get underweight;

  /// No description provided for @specialMenuAlmostReady.
  ///
  /// In en, this message translates to:
  /// **'The special menu for {petName} is almost ready!'**
  String specialMenuAlmostReady(String petName);

  /// No description provided for @acceptTermsMessage.
  ///
  /// In en, this message translates to:
  /// **'By continuing, your progress will be saved and you will be accepting the terms and conditions and privacy policy to receive the best nutrition recommendations. 🧡'**
  String get acceptTermsMessage;

  /// No description provided for @wantToKnowPet.
  ///
  /// In en, this message translates to:
  /// **'We want to know {petName}!'**
  String wantToKnowPet(String petName);

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @isNeutered.
  ///
  /// In en, this message translates to:
  /// **'Is neutered?'**
  String get isNeutered;

  /// No description provided for @isPregnantOrLactating.
  ///
  /// In en, this message translates to:
  /// **'Is {petName} pregnant or lactating?'**
  String isPregnantOrLactating(String petName);

  /// No description provided for @yourFemale.
  ///
  /// In en, this message translates to:
  /// **'Your female'**
  String get yourFemale;

  /// No description provided for @afterNeuteringAdjustments.
  ///
  /// In en, this message translates to:
  /// **'After neutering, ration adjustments are required, as the dog usually has lower caloric expenditure.'**
  String get afterNeuteringAdjustments;

  /// No description provided for @petNameQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is your {breed} called?'**
  String petNameQuestion(String breed);

  /// No description provided for @dog.
  ///
  /// In en, this message translates to:
  /// **'dog'**
  String get dog;

  /// No description provided for @myDogIsCalled.
  ///
  /// In en, this message translates to:
  /// **'My dog is called...'**
  String get myDogIsCalled;

  /// No description provided for @excitementImproveLife.
  ///
  /// In en, this message translates to:
  /// **'How exciting! 🥳 You\'re about to improve your {breed}\'s life through 100% natural nutrition.'**
  String excitementImproveLife(String breed);

  /// No description provided for @puppyExclamation.
  ///
  /// In en, this message translates to:
  /// **'{petName} is a puppy! 🥰'**
  String puppyExclamation(String petName);

  /// No description provided for @importantKnowCurrentWeight.
  ///
  /// In en, this message translates to:
  /// **'It\'s important to know their current weight to calculate their ideal portion.'**
  String get importantKnowCurrentWeight;

  /// No description provided for @knowPuppyWeightFundamental.
  ///
  /// In en, this message translates to:
  /// **'Knowing your puppy\'s weight is fundamental to adapt the feeding plan to their development stage.'**
  String get knowPuppyWeightFundamental;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @useCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use current location'**
  String get useCurrentLocation;

  /// No description provided for @detectingLocation.
  ///
  /// In en, this message translates to:
  /// **'Detecting location...'**
  String get detectingLocation;

  /// No description provided for @locationPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Location permission required'**
  String get locationPermissionRequired;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied'**
  String get locationPermissionPermanentlyDenied;

  /// No description provided for @enableLocationInSettings.
  ///
  /// In en, this message translates to:
  /// **'Please enable location access in settings'**
  String get enableLocationInSettings;

  /// No description provided for @locationServiceDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location service is disabled'**
  String get locationServiceDisabled;

  /// No description provided for @enableLocationService.
  ///
  /// In en, this message translates to:
  /// **'Please enable location service'**
  String get enableLocationService;

  /// No description provided for @locationDetectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to detect location'**
  String get locationDetectionFailed;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get openSettings;

  /// No description provided for @allowLocationAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow location access to automatically fill your address'**
  String get allowLocationAccess;

  /// No description provided for @locationDetected.
  ///
  /// In en, this message translates to:
  /// **'Location detected successfully'**
  String get locationDetected;

  /// No description provided for @unableToGetAddress.
  ///
  /// In en, this message translates to:
  /// **'Unable to get address from location'**
  String get unableToGetAddress;

  /// No description provided for @checkInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get checkInternetConnection;

  /// No description provided for @purchaseSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase completed successfully'**
  String get purchaseSuccess;

  /// No description provided for @purchaseSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your purchase has been processed successfully. Welcome to Dogfy Diet!'**
  String get purchaseSuccessMessage;
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
