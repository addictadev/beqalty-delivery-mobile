class HistoryEntry {
  final String orderId;
  final String storeName;
  final String storeDistance;
  final String deliveryLocation;
  final String deliveryDistance;
  final int itemsCount;
  final String status;
  final DateTime date;

  const HistoryEntry({
    required this.orderId,
    required this.storeName,
    required this.storeDistance,
    required this.deliveryLocation,
    required this.deliveryDistance,
    required this.itemsCount,
    required this.status,
    required this.date,
  });

  bool get isToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final entryDate = DateTime(date.year, date.month, date.day);
    return entryDate.isAtSameMomentAs(today);
  }

  bool get isYesterday {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final entryDate = DateTime(date.year, date.month, date.day);
    return entryDate.isAtSameMomentAs(yesterday);
  }

  String get dateLabel {
    if (isToday) return 'today';
    if (isYesterday) return 'yesterday';
    return 'older';
  }
}
