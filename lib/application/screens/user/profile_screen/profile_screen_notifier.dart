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
      ); // TODO: Crashlytics
    }
  }

  Future<void> refreshOrders() async {
    await loadOrders();
  }

  void filterByStatus(OrderStatus? status) {
    state = state.copyWith(selectedStatusFilter: status);
  }

  void clearStatusFilter() {
    state = state.copyWith(clearSelectedFilter: true);
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
      error: error,
      selectedStatusFilter: clearSelectedFilter ? null : (selectedStatusFilter ?? this.selectedStatusFilter),
      clearFilter: clearFilter ?? false,
    );
  }

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
