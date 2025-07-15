import 'package:dogfydiet_app/application/screens/home/create_subscription_screen/create_subscription_screen_notifier.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExitConfirmationDialog {
  static Future<bool?> show(BuildContext context, WidgetRef ref) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Shapes.borderRadiusLarge)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(Shapes.gutter),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.pets,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: Shapes.gutter),
            Text(
              context.l10n.sureYouWantToLeave,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Shapes.gutterSmall),
            Text(
              context.l10n.almostDoneDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Shapes.gutter2x),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      await ref.read(createSubscriptionScreenNotifierProvider.notifier).clearProgress();
                      if (context.mounted) {
                        context.go(HomeScreen.routePath);
                      }
                    },
                    child: Text(context.l10n.continueLater),
                  ),
                ),
                const SizedBox(width: Shapes.gutter),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.pop(false),
                    child: Text(context.l10n.comeOnStay),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}