import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/common/utilities/exit_confirmation_dialog.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PaySubscriptionScreen extends ConsumerStatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'pay-subscription';

  const PaySubscriptionScreen({super.key});

  @override
  ConsumerState<PaySubscriptionScreen> createState() => _PaySubscriptionScreenState();
}

class _PaySubscriptionScreenState extends ConsumerState<PaySubscriptionScreen> {
  Future<bool> _onWillPop() async {
    return await ExitConfirmationDialog.show(context, ref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);

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
                        context.l10n.receiveMenuWherever(state.form.petName ?? context.l10n.yourDog),
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
                      const _DatePickerField(),
                      const SizedBox(height: Shapes.gutter2x),
                      _OrderSummary(
                        petName: state.form.petName ?? context.l10n.yourDog,
                      ),
                      const SizedBox(height: Shapes.gutter2x),
                      const _DeliveryForm(),
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

class _DatePickerField extends StatelessWidget {
  const _DatePickerField();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(Shapes.borderRadius),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: Shapes.gutter),
          Expanded(
            child: Text(
              '23-07-2025',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Show date picker');
            },
            child: Text(
              context.l10n.edit,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryForm extends StatelessWidget {
  const _DeliveryForm();

  @override
  Widget build(BuildContext context) {
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
        Text(
          context.l10n.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: Shapes.gutterSmall),
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: context.l10n.myNameIs,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Shapes.borderRadius),
                ),
              ),
            ),
            const SizedBox(height: Shapes.gutter),
            TextField(
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
        DropdownButtonFormField<String>(
          value: context.l10n.spain,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
          ),
          items: [
            DropdownMenuItem(value: context.l10n.spain, child: Text(context.l10n.spain)),
          ],
          onChanged: (value) {},
        ),
        const SizedBox(height: Shapes.gutter2x),
        Text(
          context.l10n.paymentData,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: Shapes.gutter),
        const _PaymentMethodSelector(),
        const SizedBox(height: Shapes.gutter2x),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              debugPrint('Complete purchase');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: Shapes.gutter),
            ),
            child: Text(context.l10n.finalizeDogfyDiet),
          ),
        ),
      ],
    );
  }
}

class _PaymentMethodSelector extends StatefulWidget {
  const _PaymentMethodSelector();

  @override
  State<_PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<_PaymentMethodSelector> {
  String selectedMethod = 'card';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => selectedMethod = 'card'),
          child: Container(
            padding: const EdgeInsets.all(Shapes.gutter),
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedMethod == 'card'
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                width: selectedMethod == 'card' ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: 'card',
                  groupValue: selectedMethod,
                  onChanged: (value) => setState(() => selectedMethod = value!),
                ),
                const Icon(Icons.credit_card),
                const SizedBox(width: Shapes.gutter),
                Expanded(
                  child: Text(
                    context.l10n.card,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('VISA', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 4),
                    Text('MC', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 4),
                    Text('AE', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (selectedMethod == 'card') ...[
          const SizedBox(height: Shapes.gutter),
          TextField(
            decoration: InputDecoration(
              hintText: context.l10n.cardNumber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Shapes.borderRadius),
              ),
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          TextField(
            decoration: InputDecoration(
              hintText: context.l10n.securityCode,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Shapes.borderRadius),
              ),
              suffixText: '123',
            ),
          ),
        ],
      ],
    );
  }
}

class _OrderSummary extends StatelessWidget {
  final String petName;

  const _OrderSummary({required this.petName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.needsDaily(petName, '200 g'),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: Shapes.gutter),
          Container(
            padding: const EdgeInsets.all(Shapes.gutter),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(Shapes.borderRadius),
            ),
            child: Column(
              children: [
                Text(
                  context.l10n.trial14Days,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: Shapes.gutterSmall),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Shapes.gutterSmall,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        context.l10n.discountLabel(30),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '26,20 €',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(width: Shapes.gutterSmall),
                    Text(
                      '13,10 €',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: Shapes.gutterSmall),
                Text(
                  context.l10n.trialPeriodPrice('10,48'),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                context.l10n.promoCodeQuestion,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          const Divider(),
          const SizedBox(height: Shapes.gutter),
          Text(
            context.l10n.orderContents,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: Shapes.gutter),
          _OrderItem(
            title: context.l10n.chickenMenu,
            subtitle: 'x4',
            image: '🍗',
          ),
          _OrderItem(
            title: context.l10n.turkeyMenu,
            subtitle: 'x4',
            image: '🦃',
          ),
          _OrderItem(
            title: context.l10n.salmonMenu,
            subtitle: 'x3',
            image: '🐟',
          ),
          _OrderItem(
            title: context.l10n.beefMenu,
            subtitle: 'x3',
            image: '🥩',
          ),
          _OrderItem(
            title: context.l10n.welcomePack,
            subtitle: context.l10n.free,
            image: '🎁',
            isGift: true,
          ),
          const SizedBox(height: Shapes.gutter),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Text(
                context.l10n.freeShipping,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Text(
                context.l10n.securePayment,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Text(
                context.l10n.flexibility,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool isGift;

  const _OrderItem({
    required this.title,
    required this.subtitle,
    required this.image,
    this.isGift = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Shapes.gutterSmall),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                image,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: Shapes.gutter),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Shapes.gutterSmall,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: isGift ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isGift ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
