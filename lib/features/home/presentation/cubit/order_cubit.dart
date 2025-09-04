import 'package:bloc/bloc.dart';
import 'order_model.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderInitial());

  // Sample data - in real app, this would come from API
  final List<Order> _sampleOrders = [
    const Order(
      id: '#BAQ10247',
      itemCount: 5,
      pickupLocation: 'KFC Maadi',
      pickupDistance: 0.8,
      deliveryLocation: 'Zahraa El Maadi',
      deliveryDistance: 2.3,
      earnings: 45,
      estimatedTime: 25,
    ),
    const Order(
      id: '#BAQ10248',
      itemCount: 3,
      pickupLocation: 'Pizza Hut Maadi',
      pickupDistance: 1.1,
      deliveryLocation: 'Nile Corniche',
      deliveryDistance: 2.7,
      earnings: 60,
      estimatedTime: 30,
    ),
    const Order(
      id: '#BAQ10249',
      itemCount: 4,
      pickupLocation: 'Subway Maadi',
      pickupDistance: 1.5,
      deliveryLocation: 'Maadi City Center',
      deliveryDistance: 3.0,
      earnings: 50,
      estimatedTime: 20,
    ),
  ];

  final List<Order> _acceptedOrders = [];
  final List<Order> _rejectedOrders = [];

  /// Load available orders
  Future<void> loadOrders() async {
    try {
      emit(const OrderLoading());

      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 800));

      emit(
        OrderLoaded(
          orders: List.from(_sampleOrders),
          acceptedOrders: _acceptedOrders,
          rejectedOrders: _rejectedOrders,
        ),
      );
    } catch (e) {
      emit(OrderError('Failed to load orders: ${e.toString()}'));
    }
  }

  /// Accept an order
  Future<void> acceptOrder(Order order) async {
    try {
      final currentState = state;
      if (currentState is OrderLoaded) {
        // Remove from available orders
        final updatedOrders = currentState.orders
            .where((o) => o.id != order.id)
            .toList();

        // Add to accepted orders
        _acceptedOrders.add(order);

        // Emit accepted state
        emit(OrderAccepted(order: order, remainingOrders: updatedOrders));

        // Update loaded state
        emit(
          OrderLoaded(
            orders: updatedOrders,
            acceptedOrders: _acceptedOrders,
            rejectedOrders: _rejectedOrders,
          ),
        );
      }
    } catch (e) {
      emit(OrderError('Failed to accept order: ${e.toString()}'));
    }
  }

  /// Reject an order
  Future<void> rejectOrder(Order order) async {
    try {
      final currentState = state;
      if (currentState is OrderLoaded) {
        // Remove from available orders
        final updatedOrders = currentState.orders
            .where((o) => o.id != order.id)
            .toList();

        // Add to rejected orders
        _rejectedOrders.add(order);

        // Emit rejected state
        emit(OrderRejected(order: order, remainingOrders: updatedOrders));

        // Update loaded state
        emit(
          OrderLoaded(
            orders: updatedOrders,
            acceptedOrders: _acceptedOrders,
            rejectedOrders: _rejectedOrders,
          ),
        );
      }
    } catch (e) {
      emit(OrderError('Failed to reject order: ${e.toString()}'));
    }
  }

  /// Refresh orders (simulate new orders coming in)
  Future<void> refreshOrders() async {
    try {
      emit(const OrderLoading());

      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 500));

      // In real app, this would fetch new orders from API
      // For now, we'll just reload the sample data
      emit(
        OrderLoaded(
          orders: List.from(_sampleOrders),
          acceptedOrders: _acceptedOrders,
          rejectedOrders: _rejectedOrders,
        ),
      );
    } catch (e) {
      emit(OrderError('Failed to refresh orders: ${e.toString()}'));
    }
  }

  /// Clear accepted and rejected orders (for testing)
  void clearHistory() {
    _acceptedOrders.clear();
    _rejectedOrders.clear();

    final currentState = state;
    if (currentState is OrderLoaded) {
      emit(
        OrderLoaded(
          orders: currentState.orders,
          acceptedOrders: _acceptedOrders,
          rejectedOrders: _rejectedOrders,
        ),
      );
    }
  }

  /// Get current orders count
  int get availableOrdersCount {
    final currentState = state;
    if (currentState is OrderLoaded) {
      return currentState.orders.length;
    }
    return 0;
  }

  /// Get accepted orders count
  int get acceptedOrdersCount => _acceptedOrders.length;

  /// Get rejected orders count
  int get rejectedOrdersCount => _rejectedOrders.length;

  /// Check if order is accepted
  bool isOrderAccepted(String orderId) {
    return _acceptedOrders.any((order) => order.id == orderId);
  }

  /// Check if order is rejected
  bool isOrderRejected(String orderId) {
    return _rejectedOrders.any((order) => order.id == orderId);
  }
}
