part of '../pay_subscription_screen.dart';

class _LocationError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  final Future<bool> Function() onOpenSettings;
  final VoidCallback onDismiss;

  const _LocationError({
    required this.error,
    required this.onRetry,
    required this.onOpenSettings,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Shapes.borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
                size: 20,
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Expanded(
                child: Text(
                  _getErrorMessage(context, error),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              IconButton(
                onPressed: onDismiss,
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: Theme.of(context).colorScheme.error,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutterSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_shouldShowSettingsButton(error)) ...[
                TextButton(
                  onPressed: () => onOpenSettings(),
                  child: Text(
                    context.l10n.openSettings,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                const SizedBox(width: Shapes.gutterSmall),
              ],
              TextButton(
                onPressed: onRetry,
                child: Text(
                  context.l10n.tryAgain,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getErrorMessage(BuildContext context, String error) {
    switch (error) {
      case 'locationPermissionDenied':
        return context.l10n.locationPermissionDenied;
      case 'locationPermissionPermanentlyDenied':
        return context.l10n.locationPermissionPermanentlyDenied;
      case 'locationServiceDisabled':
        return context.l10n.locationServiceDisabled;
      case 'locationDetectionFailed':
        return context.l10n.locationDetectionFailed;
      default:
        return context.l10n.locationDetectionFailed;
    }
  }

  bool _shouldShowSettingsButton(String error) {
    return error == 'locationPermissionPermanentlyDenied' ||
        error == 'locationServiceDisabled';
  }
}