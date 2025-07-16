import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/application/screens/home/pay_subscription_screen/pay_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/common/utilities/exit_confirmation_dialog.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/date_picker_field.dart';
part 'widgets/delivery_form.dart';
part 'widgets/location_button.dart';
part 'widgets/location_error.dart';
part 'widgets/order_item.dart';
part 'widgets/order_summary.dart';
part 'widgets/payment_method_selector.dart';

class PaySubscriptionScreen extends ConsumerStatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'pay-subscription';

  const PaySubscriptionScreen({super.key});

  @override
  ConsumerState<PaySubscriptionScreen> createState() => _PaySubscriptionScreenState();
}

class _PaySubscriptionScreenState extends ConsumerState<PaySubscriptionScreen> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _localityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _securityCodeController = TextEditingController();

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateControllersFromState();
      _initializeCountryIfNeeded();
    });
  }

  void _initializeCountryIfNeeded() {
    if (!_isInitialized) {
      final defaultCountry = context.l10n.spain;

      Future(() {
        final payNotifier = ref.read(paySubscriptionScreenNotifierProvider.notifier);

        if (_countryController.text.isEmpty) {
          _countryController.text = defaultCountry;
          payNotifier.updateCountry(defaultCountry);
        }
        _isInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _addressController.dispose();
    _localityController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    _cardNumberController.dispose();
    _securityCodeController.dispose();
    super.dispose();
  }

  void _updateControllersFromState() {
    final payState = ref.read(paySubscriptionScreenNotifierProvider);
    final form = payState.form;

    if (_nameController.text != form.name) {
      _nameController.text = form.name;
    }
    if (_surnameController.text != form.surname) {
      _surnameController.text = form.surname;
    }
    if (_addressController.text != form.address) {
      _addressController.text = form.address;
    }
    if (_localityController.text != form.locality) {
      _localityController.text = form.locality;
    }
    if (_postalCodeController.text != form.postalCode) {
      _postalCodeController.text = form.postalCode;
    }
    if (_countryController.text != form.country) {
      _countryController.text = form.country;
    }
    if (_cardNumberController.text != form.cardNumber) {
      _cardNumberController.text = form.cardNumber;
    }
    if (_securityCodeController.text != form.securityCode) {
      _securityCodeController.text = form.securityCode;
    }
  }

  Future<bool> _onWillPop() async {
    return await ExitConfirmationDialog.show(context, ref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionState = ref.watch(createSubscriptionScreenNotifierProvider);
    final payState = ref.watch(paySubscriptionScreenNotifierProvider);
    final payNotifier = ref.read(paySubscriptionScreenNotifierProvider.notifier);

    ref.listen(paySubscriptionScreenNotifierProvider, (previous, next) {
      if (previous?.form != next.form) {
        _updateControllersFromState();
      }
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldPop = await _onWillPop();
          if (shouldPop && context.mounted) {
            context.pop();
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Shapes.gutter),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.receiveMenuWherever(
                          subscriptionState.form.petName ?? context.l10n.yourDog,
                        ),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: Shapes.gutter),
                      Row(
                        children: [
                          Text(
                            context.l10n.nextAvailableDate,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Shapes.gutterSmall,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'GLS',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Shapes.gutter),
                      _DatePickerField(
                        selectedDate: payState.form.selectedDate,
                        onDateSelected: payNotifier.updateSelectedDate,
                      ),
                      const SizedBox(height: Shapes.gutter2x),
                      _OrderSummary(
                        petName: subscriptionState.form.petName ?? context.l10n.yourDog,
                      ),
                      const SizedBox(height: Shapes.gutter2x),
                      _DeliveryForm(
                        nameController: _nameController,
                        surnameController: _surnameController,
                        addressController: _addressController,
                        localityController: _localityController,
                        postalCodeController: _postalCodeController,
                        countryController: _countryController,
                        cardNumberController: _cardNumberController,
                        securityCodeController: _securityCodeController,
                        selectedPaymentMethod: payState.form.paymentMethod,
                        isLoadingLocation: payState.isLoadingLocation,
                        isProcessingPayment: payState.isProcessingPayment,
                        locationError: payState.locationError,
                        onNameChanged: payNotifier.updateName,
                        onSurnameChanged: payNotifier.updateSurname,
                        onAddressChanged: payNotifier.updateAddress,
                        onLocalityChanged: payNotifier.updateLocality,
                        onPostalCodeChanged: payNotifier.updatePostalCode,
                        onCountryChanged: payNotifier.updateCountry,
                        onCardNumberChanged: payNotifier.updateCardNumber,
                        onSecurityCodeChanged: payNotifier.updateSecurityCode,
                        onPaymentMethodChanged: payNotifier.updatePaymentMethod,
                        onRequestLocation: payNotifier.requestLocationAndFillForm,
                        onOpenSettings: payNotifier.openAppSettings,
                        onClearLocationError: payNotifier.clearLocationError,
                        onProcessPayment: payNotifier.processPayment,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
