import 'package:dogfydiet_app/domain/model/objects/order.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';

abstract class OrderService {
  Future<List<Order>> getAllOrders();
  Future<Order?> getOrderById(String id);
  Future<void> createOrder(Order order);
  Future<void> updateOrder(Order order);
  Future<void> deleteOrder(String id);
  Future<List<Order>> getOrdersByStatus(OrderStatus status);
  Future<List<Order>> getOrdersByCustomer(String customerEmail);
  Future<void> clearAllOrders();
}