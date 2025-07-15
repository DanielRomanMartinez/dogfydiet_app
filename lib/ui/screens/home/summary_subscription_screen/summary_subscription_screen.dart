import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/common/utilities/exit_confirmation_dialog.dart';
import 'package:dogfydiet_app/ui/screens/home/pay_subscription_screen/pay_subscription_screen.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SummarySubscriptionScreen extends ConsumerWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'summary-subscription';

  const SummarySubscriptionScreen({super.key});

  Future<bool> _onWillPop(BuildContext context, WidgetRef ref) async {
    return await ExitConfirmationDialog.show(context, ref) ?? false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldPop = await _onWillPop(context, ref);
          if (shouldPop && context.mounted) {
            context.pop();
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Shapes.gutter2x),
                    child: Column(
                      children: [
                        Text(
                          context.l10n.aboutToChangeLife(state.form.petName ?? context.l10n.yourDog),
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Shapes.gutter),
                        Text(
                          context.l10n.specificNeedsDescription(state.form.petName ?? context.l10n.yourDog),
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Shapes.gutter),
                  child: Column(
                    children: [
                      const SizedBox(height: Shapes.gutter),
                      _SubscriptionPlanCard(
                        petName: state.form.petName ?? context.l10n.yourDog,
                        dailyAmount: '200g',
                        monthlyPrice: 1.31,
                        totalPrice: 18.34,
                        originalPrice: 26.20,
                        discount: 30,
                        description: context.l10n.packetsDescription('14'),
                      ),
                      const SizedBox(height: Shapes.gutter2x),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go(PaySubscriptionScreen.routePath);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: Shapes.gutter),
                          ),
                          child: Text(context.l10n.continueButton),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                  padding: const EdgeInsets.all(Shapes.gutter),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _BenefitItem(
                            percentage: '92,1%',
                            description: context.l10n.observePositiveChanges,
                            emoji: '🏃‍♀️',
                          ),
                          _BenefitItem(
                            percentage: '87,4%',
                            description: context.l10n.noticeDigestionImprovements,
                            emoji: '🐕',
                          ),
                          _BenefitItem(
                            percentage: '74%',
                            description: context.l10n.healthierShinerCoat,
                            emoji: '✨',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubscriptionPlanCard extends StatelessWidget {
  final String petName;
  final String dailyAmount;
  final double monthlyPrice;
  final double totalPrice;
  final double originalPrice;
  final int discount;
  final String description;

  const _SubscriptionPlanCard({
    required this.petName,
    required this.dailyAmount,
    required this.monthlyPrice,
    required this.totalPrice,
    required this.originalPrice,
    required this.discount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter2x),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Shapes.borderRadiusLarge),
        boxShadow: const [
          Shapes.cardShadow,
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Shapes.gutter,
              vertical: Shapes.gutterSmall,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  context.l10n.recommended,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium,
              children: [
                TextSpan(text: context.l10n.hisPlan),
                TextSpan(
                  text: dailyAmount,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: context.l10n.perDay),
              ],
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(text: context.l10n.price),
                TextSpan(
                  text: '${monthlyPrice.toStringAsFixed(2)} €',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: context.l10n.perDay),
              ],
            ),
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Shapes.gutterSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        context.l10n.discountLabel(discount),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: Shapes.gutterSmall),
                    Text(
                      '${originalPrice.toStringAsFixed(2)} €',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: Shapes.gutterSmall),
                    Text(
                      '${totalPrice.toStringAsFixed(2)} €',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  final String percentage;
  final String description;
  final String emoji;

  const _BenefitItem({
    required this.percentage,
    required this.description,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Shapes.gutter),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(Shapes.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: Shapes.gutterSmall),
            Text(
              percentage,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}