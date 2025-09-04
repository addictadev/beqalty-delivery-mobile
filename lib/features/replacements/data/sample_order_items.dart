import 'package:baqaltydeliveryapp/features/replacements/data/order_item.dart';

class SampleOrderItems {
  static List<OrderItem> getSampleOrderItems() {
    return [
      const OrderItem(
        id: 'item_001',
        name: 'Chocolate Milk',
        imageUrl: 'assets/images/chocolate_milk.png',
        quantity: 2,
        price: 12.25,
        currency: 'EGP',
        description: 'Rich and creamy chocolate milk',
        brand: 'Coffee Shake',
        category: 'Dairy',
      ),
      const OrderItem(
        id: 'item_002',
        name: 'Chocolate Milk',
        imageUrl: 'assets/images/chocolate_milk.png',
        quantity: 2,
        price: 12.25,
        currency: 'EGP',
        description: 'Rich and creamy chocolate milk',
        brand: 'Coffee Shake',
        category: 'Dairy',
      ),
      const OrderItem(
        id: 'item_003',
        name: 'Chocolate Milk',
        imageUrl: 'assets/images/chocolate_milk.png',
        quantity: 2,
        price: 12.25,
        currency: 'EGP',
        description: 'Rich and creamy chocolate milk',
        brand: 'Coffee Shake',
        category: 'Dairy',
      ),
    ];
  }

  static List<OrderItem> getOrderItemsByCategory(String category) {
    final items = getSampleOrderItems();
    return items.where((item) => item.category == category).toList();
  }

  static double getTotalPrice() {
    final items = getSampleOrderItems();
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  static int getTotalQuantity() {
    final items = getSampleOrderItems();
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
