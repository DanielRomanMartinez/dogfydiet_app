part of '../pay_subscription_screen.dart';

class _DeliveryForm extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController addressController;
  final TextEditingController localityController;
  final TextEditingController postalCodeController;
  final TextEditingController cardNumberController;
  final TextEditingController securityCodeController;
  final TextEditingController countryController;
  final String selectedPaymentMethod;
  final bool isLoadingLocation;
  final bool isProcessingPayment;
  final String? locationError;
  final Function(String) onNameChanged;
  final Function(String) onSurnameChanged;
  final Function(String) onAddressChanged;
  final Function(String) onLocalityChanged;
  final Function(String) onPostalCodeChanged;
  final Function(String) onCountryChanged;
  final Function(String) onCardNumberChanged;
  final Function(String) onSecurityCodeChanged;
  final Function(String) onPaymentMethodChanged;
  final Future<LocationPermissionResult> Function() onRequestLocation;
  final Future<bool> Function() onOpenSettings;
  final VoidCallback onClearLocationError;
  final Future<bool> Function() onProcessPayment;

  const _DeliveryForm({
    required this.nameController,
    required this.surnameController,
    required this.addressController,
    required this.localityController,
    required this.postalCodeController,
    required this.cardNumberController,
    required this.securityCodeController,
    required this.countryController,
    required this.selectedPaymentMethod,
    required this.isLoadingLocation,
    required this.isProcessingPayment,
    required this.locationError,
    required this.onNameChanged,
    required this.onSurnameChanged,
    required this.onAddressChanged,
    required this.onLocalityChanged,
    required this.onPostalCodeChanged,
    required this.onCountryChanged,
    required this.onCardNumberChanged,
    required this.onSecurityCodeChanged,
    required this.onPaymentMethodChanged,
    required this.onRequestLocation,
    required this.onOpenSettings,
    required this.onClearLocationError,
    required this.onProcessPayment,
  });

  Future<void> _handlePaymentProcess(BuildContext context, WidgetRef ref) async {
    final success = await onProcessPayment();

    if (success && context.mounted) {
      await _showSuccessDialog(context, ref);
    }
  }

  Future<void> _showSuccessDialog(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.purchaseSuccess),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.purchaseSuccessMessage,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await ref.read(createSubscriptionScreenNotifierProvider.notifier).clearProgress();
                if (context.mounted) {
                  context.go(HomeScreen.routePath);
                }
              },
              child: Text(context.l10n.continueButton),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.deliveryData,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Shapes.gutter),

        _LocationButton(
          isLoading: isLoadingLocation,
          error: locationError,
          onRequestLocation: onRequestLocation,
          onOpenSettings: onOpenSettings,
          onClearError: onClearLocationError,
        ),

        const SizedBox(height: Shapes.gutter),
        Text(
          context.l10n.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Shapes.gutterSmall),
        Column(
          children: [
            TextField(
              controller: nameController,
              onChanged: onNameChanged,
              decoration: InputDecoration(
                hintText: context.l10n.myNameIs,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Shapes.borderRadius),
                ),
              ),
            ),
            const SizedBox(height: Shapes.gutter),
            TextField(
              controller: surnameController,
              onChanged: onSurnameChanged,
              decoration: InputDecoration(
                hintText: context.l10n.mySurnameIs,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Shapes.borderRadius),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: Shapes.gutter),
        Text(
          context.l10n.fullAddress,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Shapes.gutterSmall),
        TextField(
          controller: addressController,
          onChanged: onAddressChanged,
          decoration: InputDecoration(
            hintText: context.l10n.myAddressIs,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
        ),
        const SizedBox(height: Shapes.gutter),
        Text(
          context.l10n.locality,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Shapes.gutterSmall),
        TextField(
          controller: localityController,
          onChanged: onLocalityChanged,
          decoration: InputDecoration(
            hintText: context.l10n.myLocalityIs,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
        ),
        const SizedBox(height: Shapes.gutter),
        Text(
          context.l10n.postalCode,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Shapes.gutterSmall),
        TextField(
          controller: postalCodeController,
          onChanged: onPostalCodeChanged,
          decoration: InputDecoration(
            hintText: context.l10n.myPostalCodeIs,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
        ),
        const SizedBox(height: Shapes.gutter),
        Text(
          context.l10n.country,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Shapes.gutterSmall),
        TextField(
          controller: countryController,
          onChanged: onCountryChanged,
          decoration: InputDecoration(
            hintText: context.l10n.spain,
            prefixIcon: const Icon(Icons.public),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
        ),
        const SizedBox(height: Shapes.gutter2x),
        Text(
          context.l10n.paymentData,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Shapes.gutter),
        _PaymentMethodSelector(
          selectedMethod: selectedPaymentMethod,
          cardNumberController: cardNumberController,
          securityCodeController: securityCodeController,
          onMethodChanged: onPaymentMethodChanged,
          onCardNumberChanged: onCardNumberChanged,
          onSecurityCodeChanged: onSecurityCodeChanged,
        ),
        const SizedBox(height: Shapes.gutter2x),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isProcessingPayment ? null : () async {
              await _handlePaymentProcess(context, ref);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: Shapes.gutter),
            ),
            child: isProcessingPayment
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : Text(context.l10n.finalizeDogfyDiet),
          ),
        ),
      ],
    );
  }
}