import 'package:dogfydiet_app/domain/model/objects/order.dart';

abstract class OrderService {
  Future<List<Order>> getAllOrders();
  Future<Order?> getOrderById(String id);
}