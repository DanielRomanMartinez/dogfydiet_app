import 'package:dogfydiet_app/domain/model/objects/order.dart';
import 'package:dogfydiet_app/domain/model/objects/order_item.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';
import 'package:dogfydiet_app/domain/services/order_service.dart';

class OrderServiceImpl implements OrderService {
  // In-memory storage for now (will be replaced with Hive later)
  final Map<String, Order> _orders = {};

  OrderServiceImpl() {
    _initializeSampleData();
  }

  void _initializeSampleData() {
    // Create sample orders for testing
    final sampleOrders = [
      Order(
        id: '1',
        customerName: 'Juan Pérez',
        customerEmail: 'juan@example.com',
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
        items: const [
          OrderItem(
            id: '1',
            productId: 'prod_1',
            productName: 'Comida Premium para Perros',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 25.99,
            quantity: 2,
            productDescription: 'Comida premium para perros adultos',
            productCategory: 'Alimentación',
          ),
          OrderItem(
            id: '2',
            productId: 'prod_2',
            productName: 'Juguete Masticable',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 12.50,
            quantity: 1,
            productDescription: 'Juguete resistente para masticar',
            productCategory: 'Juguetes',
          ),
        ],
        totalAmount: 64.48,
        status: OrderStatus.delivered,
        notes: 'Entregado en portería',
      ),
      Order(
        id: '2',
        customerName: 'María García',
        customerEmail: 'maria@example.com',
        orderDate: DateTime.now().subtract(const Duration(days: 3)),
        items: const [
          OrderItem(
            id: '3',
            productId: 'prod_3',
            productName: 'Collar Antipulgas',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 18.75,
            quantity: 1,
            productDescription: 'Collar antipulgas para perros medianos',
            productCategory: 'Higiene',
          ),
        ],
        totalAmount: 18.75,
        status: OrderStatus.processing,
        notes: 'Cliente prefiere entrega por la mañana',
      ),
      Order(
        id: '3',
        customerName: 'Carlos Rodríguez',
        customerEmail: 'carlos@example.com',
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
        items: const [
          OrderItem(
            id: '4',
            productId: 'prod_4',
            productName: 'Cama Ortopédica',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 45.00,
            quantity: 1,
            productDescription: 'Cama ortopédica para perros grandes',
            productCategory: 'Accesorios',
          ),
          OrderItem(
            id: '5',
            productId: 'prod_5',
            productName: 'Shampoo Especial',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 8.99,
            quantity: 3,
            productDescription: 'Shampoo especial para piel sensible',
            productCategory: 'Higiene',
          ),
        ],
        totalAmount: 71.97,
        status: OrderStatus.shipped,
        notes: null,
      ),
      Order(
        id: '4',
        customerName: 'Ana López',
        customerEmail: 'ana@example.com',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
        items: const [
          OrderItem(
            id: '6',
            productId: 'prod_6',
            productName: 'Vitaminas para Cachorros',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 15.50,
            quantity: 2,
            productDescription: 'Vitaminas esenciales para cachorros',
            productCategory: 'Salud',
          ),
        ],
        totalAmount: 31.00,
        status: OrderStatus.pending,
        notes: 'Pedido urgente',
      ),
      Order(
        id: '5',
        customerName: 'Luis Martín',
        customerEmail: 'luis@example.com',
        orderDate: DateTime.now().subtract(const Duration(days: 7)),
        items: const [
          OrderItem(
            id: '7',
            productId: 'prod_7',
            productName: 'Correa Extensible',
            productImage: 'https://via.placeholder.com/150',
            unitPrice: 22.30,
            quantity: 1,
            productDescription: 'Correa extensible hasta 5 metros',
            productCategory: 'Accesorios',
          ),
        ],
        totalAmount: 22.30,
        status: OrderStatus.cancelled,
        notes: 'Cancelado por el cliente',
      ),
    ];

    for (final order in sampleOrders) {
      _orders[order.id] = order;
    }
  }

  @override
  Future<List<Order>> getAllOrders() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulating http connection delay
    return _orders.values.toList()..sort((a, b) => b.orderDate.compareTo(a.orderDate));
  }

  @override
  Future<Order?> getOrderById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _orders[id];
  }
}
