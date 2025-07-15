enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

extension OrderStatusExtension on OrderStatus {
  String get statusColor {
    switch (this) {
      case OrderStatus.pending:
        return 'orange';
      case OrderStatus.processing:
        return 'blue';
      case OrderStatus.shipped:
        return 'purple';
      case OrderStatus.delivered:
        return 'green';
      case OrderStatus.cancelled:
        return 'red';
    }
  }
}