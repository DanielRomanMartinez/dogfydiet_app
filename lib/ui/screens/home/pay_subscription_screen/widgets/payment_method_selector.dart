part of '../pay_subscription_screen.dart';

class _PaymentMethodSelector extends StatelessWidget {
  final String selectedMethod;
  final TextEditingController cardNumberController;
  final TextEditingController securityCodeController;
  final Function(String) onMethodChanged;
  final Function(String) onCardNumberChanged;
  final Function(String) onSecurityCodeChanged;

  const _PaymentMethodSelector({
    required this.selectedMethod,
    required this.cardNumberController,
    required this.securityCodeController,
    required this.onMethodChanged,
    required this.onCardNumberChanged,
    required this.onSecurityCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onMethodChanged('card'),
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
                  onChanged: (value) => onMethodChanged(value!),
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
            controller: cardNumberController,
            onChanged: onCardNumberChanged,
            decoration: InputDecoration(
              hintText: context.l10n.cardNumber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Shapes.borderRadius),
              ),
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          TextField(
            controller: securityCodeController,
            onChanged: onSecurityCodeChanged,
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