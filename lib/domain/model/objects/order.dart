import 'package:dogfydiet_app/domain/model/objects/order_item.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String customerName;
  final String customerEmail;
  final DateTime orderDate;
  final List<OrderItem> items;
  final double totalAmount;
  final OrderStatus status;
  final String? notes;

  const Order({
    required this.id,
    required this.customerName,
    required this.customerEmail,
    required this.orderDate,
    required this.items,
    required this.totalAmount,
    required this.status,
    this.notes,
  });

  double get calculatedTotal => items.fold(0, (sum, item) => sum + item.totalPrice);

  Order copyWith({
    String? id,
    String? customerName,
    String? customerEmail,
    DateTime? orderDate,
    List<OrderItem>? items,
    double? totalAmount,
    OrderStatus? status,
    String? notes,
  }) {
    return Order(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      orderDate: orderDate ?? this.orderDate,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'orderDate': orderDate.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'status': status.index,
      'notes': notes,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
      orderDate: DateTime.parse(json['orderDate']),
      items: (json['items'] as List).map((item) => OrderItem.fromJson(item)).toList(),
      totalAmount: json['totalAmount'].toDouble(),
      status: OrderStatus.values[json['status']],
      notes: json['notes'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        customerName,
        customerEmail,
        orderDate,
        items,
        totalAmount,
        status,
        notes,
      ];
}
