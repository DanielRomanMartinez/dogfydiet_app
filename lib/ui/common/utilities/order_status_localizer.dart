import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';


class OrderStatusLocalizer {
  static String getDisplayName(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return context.l10n.pending;
      case OrderStatus.processing:
        return context.l10n.processing;
      case OrderStatus.shipped:
        return context.l10n.shipped;
      case OrderStatus.delivered:
        return context.l10n.delivered;
      case OrderStatus.cancelled:
        return context.l10n.cancelled;
    }
  }

  static Color getStatusColor(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange.shade700;
      case OrderStatus.processing:
        return Colors.blue.shade700;
      case OrderStatus.shipped:
        return Colors.purple.shade700;
      case OrderStatus.delivered:
        return Colors.green.shade700;
      case OrderStatus.cancelled:
        return Colors.red.shade700;
    }
  }

  static Color getStatusBackgroundColor(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange.withValues(alpha: 0.2);
      case OrderStatus.processing:
        return Colors.blue.withValues(alpha: 0.2);
      case OrderStatus.shipped:
        return Colors.purple.withValues(alpha: 0.2);
      case OrderStatus.delivered:
        return Colors.green.withValues(alpha: 0.2);
      case OrderStatus.cancelled:
        return Colors.red.withValues(alpha: 0.2);
    }
  }
}