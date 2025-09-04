class OrderItem {
  final String id;
  final String name;
  final String imageUrl;
  final int quantity;
  final double price;
  final String currency;
  final String? description;
  final String? brand;
  final String? category;

  const OrderItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    this.currency = 'EGP',
    this.description,
    this.brand,
    this.category,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'EGP',
      description: json['description'],
      brand: json['brand'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'price': price,
      'currency': currency,
      'description': description,
      'brand': brand,
      'category': category,
    };
  }

  OrderItem copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? quantity,
    double? price,
    String? currency,
    String? description,
    String? brand,
    String? category,
  }) {
    return OrderItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      category: category ?? this.category,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderItem &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.quantity == quantity &&
        other.price == price &&
        other.currency == currency &&
        other.description == description &&
        other.brand == brand &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        currency.hashCode ^
        description.hashCode ^
        brand.hashCode ^
        category.hashCode;
  }

  @override
  String toString() {
    return 'OrderItem(id: $id, name: $name, imageUrl: $imageUrl, quantity: $quantity, price: $price, currency: $currency, description: $description, brand: $brand, category: $category)';
  }
}
