part of '../pay_subscription_screen.dart';

class _LocationButton extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final Future<LocationPermissionResult> Function() onRequestLocation;
  final Future<bool> Function() onOpenSettings;
  final VoidCallback onClearError;

  const _LocationButton({
    required this.isLoading,
    required this.error,
    required this.onRequestLocation,
    required this.onOpenSettings,
    required this.onClearError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(Shapes.gutter),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(Shapes.borderRadius),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Shapes.gutterSmall),
                  Expanded(
                    child: Text(
                      context.l10n.allowLocationAccess,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Shapes.gutter),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: isLoading ? null : () => _handleLocationRequest(context),
                  icon: isLoading
                      ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  )
                      : const Icon(Icons.my_location),
                  label: Text(
                    isLoading
                        ? context.l10n.detectingLocation
                        : context.l10n.useCurrentLocation,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: Shapes.gutterSmall),
          _LocationError(
            error: error!,
            onRetry: () => _handleLocationRequest(context),
            onOpenSettings: onOpenSettings,
            onDismiss: onClearError,
          ),
        ],
      ],
    );
  }

  Future<void> _handleLocationRequest(BuildContext context) async {
    final result = await onRequestLocation();

    if (!context.mounted) return;

    switch (result) {
      case LocationPermissionResult.granted:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Text(context.l10n.locationDetected),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
        break;
      case LocationPermissionResult.denied:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.location_off, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(context.l10n.locationPermissionDenied),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
            action: SnackBarAction(
              label: context.l10n.tryAgain,
              textColor: Colors.white,
              onPressed: () => _handleLocationRequest(context),
            ),
          ),
        );
        break;
      case LocationPermissionResult.permanentlyDenied:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.settings, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(context.l10n.locationPermissionPermanentlyDenied),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: context.l10n.openSettings,
              textColor: Colors.white,
              onPressed: () => onOpenSettings(),
            ),
          ),
        );
        break;
      case LocationPermissionResult.serviceDisabled:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.gps_off, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(context.l10n.locationServiceDisabled),
                ),
              ],
            ),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
            action: SnackBarAction(
              label: context.l10n.enableLocationService,
              textColor: Colors.white,
              onPressed: () => _handleLocationRequest(context),
            ),
          ),
        );
        break;
      case LocationPermissionResult.error:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(context.l10n.locationDetectionFailed),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: context.l10n.tryAgain,
              textColor: Colors.white,
              onPressed: () => _handleLocationRequest(context),
            ),
          ),
        );
        break;
    }
  }
}