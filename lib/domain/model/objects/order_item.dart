import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final double unitPrice;
  final int quantity;
  final String? productDescription;
  final String? productCategory;

  const OrderItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
    this.productDescription,
    this.productCategory,
  });

  double get totalPrice => unitPrice * quantity;

  OrderItem copyWith({
    String? id,
    String? productId,
    String? productName,
    String? productImage,
    double? unitPrice,
    int? quantity,
    String? productDescription,
    String? productCategory,
  }) {
    return OrderItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
      productDescription: productDescription ?? this.productDescription,
      productCategory: productCategory ?? this.productCategory,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'productDescription': productDescription,
      'productCategory': productCategory,
    };
  }

  // Create from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      productId: json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      unitPrice: json['unitPrice'].toDouble(),
      quantity: json['quantity'],
      productDescription: json['productDescription'],
      productCategory: json['productCategory'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        productName,
        productImage,
        unitPrice,
        quantity,
        productDescription,
        productCategory,
      ];
}
