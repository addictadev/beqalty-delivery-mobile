class EarningEntry {
  final String orderId;
  final String time;
  final double amount;
  final DateTime date;

  const EarningEntry({
    required this.orderId,
    required this.time,
    required this.amount,
    required this.date,
  });

  factory EarningEntry.fromJson(Map<String, dynamic> json) {
    return EarningEntry(
      orderId: json['orderId'] ?? '',
      time: json['time'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'time': time,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool get isYesterday {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  String get dateLabel {
    if (isToday) return 'Today';
    if (isYesterday) return 'Yesterday';
    return '${date.day}/${date.month}/${date.year}';
  }
}
