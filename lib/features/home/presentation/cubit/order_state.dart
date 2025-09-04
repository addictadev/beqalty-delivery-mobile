import 'package:equatable/equatable.dart';
import 'order_model.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  final List<Order> acceptedOrders;
  final List<Order> rejectedOrders;

  const OrderLoaded({
    required this.orders,
    this.acceptedOrders = const [],
    this.rejectedOrders = const [],
  });

  @override
  List<Object?> get props => [orders, acceptedOrders, rejectedOrders];

  OrderLoaded copyWith({
    List<Order>? orders,
    List<Order>? acceptedOrders,
    List<Order>? rejectedOrders,
  }) {
    return OrderLoaded(
      orders: orders ?? this.orders,
      acceptedOrders: acceptedOrders ?? this.acceptedOrders,
      rejectedOrders: rejectedOrders ?? this.rejectedOrders,
    );
  }
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderAccepted extends OrderState {
  final Order order;
  final List<Order> remainingOrders;

  const OrderAccepted({
    required this.order,
    required this.remainingOrders,
  });

  @override
  List<Object?> get props => [order, remainingOrders];
}

class OrderRejected extends OrderState {
  final Order order;
  final List<Order> remainingOrders;

  const OrderRejected({
    required this.order,
    required this.remainingOrders,
  });

  @override
  List<Object?> get props => [order, remainingOrders];
}
