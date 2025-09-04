class Order {
  final String id;
  final int itemCount;
  final String pickupLocation;
  final double pickupDistance;
  final String deliveryLocation;
  final double deliveryDistance;
  final double earnings;
  final int estimatedTime;

  const Order({
    required this.id,
    required this.itemCount,
    required this.pickupLocation,
    required this.pickupDistance,
    required this.deliveryLocation,
    required this.deliveryDistance,
    required this.earnings,
    required this.estimatedTime,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      itemCount: json['itemCount'] ?? 0,
      pickupLocation: json['pickupLocation'] ?? '',
      pickupDistance: (json['pickupDistance'] ?? 0.0).toDouble(),
      deliveryLocation: json['deliveryLocation'] ?? '',
      deliveryDistance: (json['deliveryDistance'] ?? 0.0).toDouble(),
      earnings: (json['earnings'] ?? 0.0).toDouble(),
      estimatedTime: json['estimatedTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemCount': itemCount,
      'pickupLocation': pickupLocation,
      'pickupDistance': pickupDistance,
      'deliveryLocation': deliveryLocation,
      'deliveryDistance': deliveryDistance,
      'earnings': earnings,
      'estimatedTime': estimatedTime,
    };
  }

  Order copyWith({
    String? id,
    int? itemCount,
    String? pickupLocation,
    double? pickupDistance,
    String? deliveryLocation,
    double? deliveryDistance,
    double? earnings,
    int? estimatedTime,
  }) {
    return Order(
      id: id ?? this.id,
      itemCount: itemCount ?? this.itemCount,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      pickupDistance: pickupDistance ?? this.pickupDistance,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      deliveryDistance: deliveryDistance ?? this.deliveryDistance,
      earnings: earnings ?? this.earnings,
      estimatedTime: estimatedTime ?? this.estimatedTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        other.id == id &&
        other.itemCount == itemCount &&
        other.pickupLocation == pickupLocation &&
        other.pickupDistance == pickupDistance &&
        other.deliveryLocation == deliveryLocation &&
        other.deliveryDistance == deliveryDistance &&
        other.earnings == earnings &&
        other.estimatedTime == estimatedTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemCount.hashCode ^
        pickupLocation.hashCode ^
        pickupDistance.hashCode ^
        deliveryLocation.hashCode ^
        deliveryDistance.hashCode ^
        earnings.hashCode ^
        estimatedTime.hashCode;
  }

  @override
  String toString() {
    return 'Order(id: $id, itemCount: $itemCount, pickupLocation: $pickupLocation, pickupDistance: $pickupDistance, deliveryLocation: $deliveryLocation, deliveryDistance: $deliveryDistance, earnings: $earnings, estimatedTime: $estimatedTime)';
  }
}
