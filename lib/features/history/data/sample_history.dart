import 'package:baqaltydeliveryapp/features/history/data/history_entry.dart';

class SampleHistory {
  static List<HistoryEntry> getSampleHistory() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    return [
      // Today's orders
      HistoryEntry(
        orderId: '#BAQ10248',
        storeName: 'Pizza Hut Maadi',
        storeDistance: '1.1 km',
        deliveryLocation: 'Nile Corniche',
        deliveryDistance: '2.7 km',
        itemsCount: 3,
        status: 'delivered',
        date: today,
      ),
      HistoryEntry(
        orderId: '#BAQ10249',
        storeName: 'McDonald\'s Maadi',
        storeDistance: '0.8 km',
        deliveryLocation: 'Cairo Festival City',
        deliveryDistance: '3.2 km',
        itemsCount: 2,
        status: 'delivered',
        date: today,
      ),
      HistoryEntry(
        orderId: '#BAQ10250',
        storeName: 'KFC Heliopolis',
        storeDistance: '2.1 km',
        deliveryLocation: 'Airport Road',
        deliveryDistance: '1.5 km',
        itemsCount: 4,
        status: 'failed',
        date: today,
      ),

      // Yesterday's orders
      HistoryEntry(
        orderId: '#BAQ10245',
        storeName: 'Domino\'s Zamalek',
        storeDistance: '1.5 km',
        deliveryLocation: 'Garden City',
        deliveryDistance: '2.0 km',
        itemsCount: 1,
        status: 'delivered',
        date: yesterday,
      ),
      HistoryEntry(
        orderId: '#BAQ10246',
        storeName: 'Burger King Downtown',
        storeDistance: '0.9 km',
        deliveryLocation: 'Tahrir Square',
        deliveryDistance: '1.8 km',
        itemsCount: 2,
        status: 'delivered',
        date: yesterday,
      ),
      HistoryEntry(
        orderId: '#BAQ10247',
        storeName: 'Subway Mohandessin',
        storeDistance: '1.3 km',
        deliveryLocation: 'Dokki',
        deliveryDistance: '2.3 km',
        itemsCount: 3,
        status: 'delivered',
        date: yesterday,
      ),
    ];
  }

  static List<HistoryEntry> getHistoryByDate(String dateLabel) {
    final history = getSampleHistory();
    return history.where((entry) => entry.dateLabel == dateLabel).toList();
  }

  static List<HistoryEntry> searchHistory(String query) {
    final history = getSampleHistory();
    if (query.isEmpty) return history;

    return history
        .where(
          (entry) =>
              entry.orderId.toLowerCase().contains(query.toLowerCase()) ||
              entry.storeName.toLowerCase().contains(query.toLowerCase()) ||
              entry.deliveryLocation.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
  }
}
