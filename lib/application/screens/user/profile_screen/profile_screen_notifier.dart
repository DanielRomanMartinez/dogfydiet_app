import 'package:dogfydiet_app/config/providers.dart';
import 'package:dogfydiet_app/domain/model/objects/order.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_notifier.g.dart';

@riverpod
class ProfileScreenNotifier extends _$ProfileScreenNotifier {
  @override
  ProfileScreenState build() {
    const initialState = ProfileScreenState(
      orders: [],
      isLoading: true,
      error: null,
      selectedStatusFilter: null,
      clearFilter: false,
    );

    Future.microtask(() => loadOrders());

    return initialState;
  }

  Future<void> loadOrders() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final orderService = ref.read(orderServiceProvider);
      final orders = await orderService.getAllOrders();

      state = state.copyWith(
        orders: orders,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Error al cargar los pedidos: $e',
      );
    }
  }

  Future<void> refreshOrders() async {
    await loadOrders();
  }

  void filterByStatus(OrderStatus? status) {
    state = state.copyWith(selectedStatusFilter: status);
  }

  void clearStatusFilter() {
    // CORREGIDO: Usar copyWith con clearSelectedFilter
    state = state.copyWith(clearSelectedFilter: true);
  }

  Future<void> deleteOrder(String orderId) async {
    try {
      final orderService = ref.read(orderServiceProvider);
      await orderService.deleteOrder(orderId);
      await loadOrders(); // Refresh the list
    } catch (e) {
      state = state.copyWith(
        error: 'Error al eliminar el pedido: $e',
      );
    }
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      final orderService = ref.read(orderServiceProvider);
      final order = state.orders.firstWhere((o) => o.id == orderId);
      final updatedOrder = order.copyWith(status: newStatus);
      await orderService.updateOrder(updatedOrder);
      await loadOrders(); // Refresh the list
    } catch (e) {
      state = state.copyWith(
        error: 'Error al actualizar el pedido: $e',
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

class ProfileScreenState extends Equatable {
  final List<Order> orders;
  final bool isLoading;
  final String? error;
  final OrderStatus? selectedStatusFilter;
  final bool clearFilter;

  const ProfileScreenState({
    this.orders = const [],
    this.isLoading = false,
    this.error,
    this.selectedStatusFilter,
    this.clearFilter = false,
  });

  ProfileScreenState copyWith({
    List<Order>? orders,
    bool? isLoading,
    String? error,
    OrderStatus? selectedStatusFilter,
    bool? clearFilter,
    bool clearSelectedFilter = false,
  }) {
    return ProfileScreenState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      error: error, // CORREGIDO: No usar ?? para error, permitir null explícito
      selectedStatusFilter: clearSelectedFilter ? null : (selectedStatusFilter ?? this.selectedStatusFilter),
      clearFilter: clearFilter ?? false,
    );
  }

  // Helper methods
  List<Order> get filteredOrders {
    if (selectedStatusFilter == null) {
      return orders;
    }
    return orders.where((order) => order.status == selectedStatusFilter).toList();
  }

  double get totalOrdersValue {
    return filteredOrders.fold(0, (sum, order) => sum + order.totalAmount);
  }

  int get totalOrdersCount => filteredOrders.length;

  @override
  List<Object?> get props => [
        orders,
        isLoading,
        error,
        selectedStatusFilter,
        clearFilter,
      ];
}
