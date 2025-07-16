import 'package:dogfydiet_app/application/screens/user/profile_screen/profile_screen_notifier.dart';
import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/order.dart';
import 'package:dogfydiet_app/domain/model/objects/order_item.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';
import 'package:dogfydiet_app/domain/services/order_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_screen_notifier_test.mocks.dart';

@GenerateMocks([OrderService])
void main() {
  late MockOrderService mockOrderService;
  late ProviderContainer container;

  setUp(() {
    mockOrderService = MockOrderService();
    container = ProviderContainer(
      overrides: [
        orderServiceProvider.overrideWithValue(mockOrderService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ProfileScreenNotifier', () {
    test('should return initial state', () {
      final state = container.read(profileScreenNotifierProvider);

      expect(state.orders, isEmpty);
      expect(state.isLoading, true);
      expect(state.error, isNull);
      expect(state.selectedStatusFilter, isNull);
      expect(state.clearFilter, false);
    });

    test('should load orders successfully', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [
            OrderItem(
              id: '1',
              productId: 'prod1',
              productName: 'Product 1',
              productImage: 'image1.jpg',
              unitPrice: 10.0,
              quantity: 2,
            ),
          ],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.orders, mockOrders);
      expect(state.isLoading, false);
      expect(state.error, isNull);
      verify(mockOrderService.getAllOrders()).called(2);
    });

    test('should handle error when loading orders', () async {
      const errorMessage = 'Network error';
      when(mockOrderService.getAllOrders()).thenThrow(Exception(errorMessage));

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.orders, isEmpty);
      expect(state.isLoading, false);
      expect(state.error, contains(errorMessage));
    });

    test('should refresh orders', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.refreshOrders();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.orders, mockOrders);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('should filter orders by status', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
        Order(
          id: '2',
          customerName: 'Jane Doe',
          customerEmail: 'jane@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 30.0,
          status: OrderStatus.delivered,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();
      notifier.filterByStatus(OrderStatus.pending);

      final state = container.read(profileScreenNotifierProvider);
      expect(state.selectedStatusFilter, OrderStatus.pending);
      expect(state.filteredOrders.length, 1);
      expect(state.filteredOrders.first.status, OrderStatus.pending);
    });

    test('should clear status filter', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();
      notifier.filterByStatus(OrderStatus.pending);
      notifier.clearStatusFilter();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.selectedStatusFilter, isNull);
      expect(state.filteredOrders, mockOrders);
    });

    test('should clear error', () async {
      when(mockOrderService.getAllOrders()).thenThrow(Exception('Error'));

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();
      notifier.clearError();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.error, isNull);
    });

    test('should calculate total orders value correctly', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
        Order(
          id: '2',
          customerName: 'Jane Doe',
          customerEmail: 'jane@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 30.0,
          status: OrderStatus.delivered,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.totalOrdersValue, 50.0);
    });

    test('should calculate total orders count correctly', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
        Order(
          id: '2',
          customerName: 'Jane Doe',
          customerEmail: 'jane@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 30.0,
          status: OrderStatus.delivered,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();

      final state = container.read(profileScreenNotifierProvider);
      expect(state.totalOrdersCount, 2);
    });

    test('should filter orders and calculate filtered totals', () async {
      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
        Order(
          id: '2',
          customerName: 'Jane Doe',
          customerEmail: 'jane@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 30.0,
          status: OrderStatus.delivered,
        ),
      ];
      when(mockOrderService.getAllOrders()).thenAnswer((_) async => mockOrders);

      final notifier = container.read(profileScreenNotifierProvider.notifier);
      await notifier.loadOrders();
      notifier.filterByStatus(OrderStatus.pending);

      final state = container.read(profileScreenNotifierProvider);
      expect(state.totalOrdersValue, 20.0);
      expect(state.totalOrdersCount, 1);
    });
  });

  group('ProfileScreenState', () {
    test('should create state with default values', () {
      const state = ProfileScreenState(
        orders: [],
        isLoading: false,
        error: null,
        selectedStatusFilter: null,
        clearFilter: false,
      );

      expect(state.orders, isEmpty);
      expect(state.isLoading, false);
      expect(state.error, isNull);
      expect(state.selectedStatusFilter, isNull);
      expect(state.clearFilter, false);
    });

    test('should create new state with copyWith', () {
      const initialState = ProfileScreenState(
        orders: [],
        isLoading: false,
        error: null,
        selectedStatusFilter: null,
        clearFilter: false,
      );

      final mockOrders = [
        Order(
          id: '1',
          customerName: 'John Doe',
          customerEmail: 'john@example.com',
          orderDate: DateTime.now(),
          items: const [],
          totalAmount: 20.0,
          status: OrderStatus.pending,
        ),
      ];

      final newState = initialState.copyWith(
        orders: mockOrders,
        isLoading: true,
        selectedStatusFilter: OrderStatus.pending,
      );

      expect(newState.orders, mockOrders);
      expect(newState.isLoading, true);
      expect(newState.selectedStatusFilter, OrderStatus.pending);
      expect(newState.error, isNull);
      expect(newState.clearFilter, false);
    });

    test('should clear selected filter with clearSelectedFilter flag', () {
      const initialState = ProfileScreenState(
        orders: [],
        isLoading: false,
        error: null,
        selectedStatusFilter: OrderStatus.pending,
        clearFilter: false,
      );

      final newState = initialState.copyWith(clearSelectedFilter: true);

      expect(newState.selectedStatusFilter, isNull);
    });

    test('should support equality', () {
      const state1 = ProfileScreenState(
        orders: [],
        isLoading: false,
        error: null,
        selectedStatusFilter: null,
        clearFilter: false,
      );

      const state2 = ProfileScreenState(
        orders: [],
        isLoading: false,
        error: null,
        selectedStatusFilter: null,
        clearFilter: false,
      );

      expect(state1, equals(state2));
    });
  });
}