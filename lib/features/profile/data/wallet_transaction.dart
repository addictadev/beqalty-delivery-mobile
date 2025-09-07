class WalletTransaction {
  final String transactionId;
  final double amount;
  final String currency;
  final DateTime date;
  final String time;
  final TransactionType type;
  final String? description;

  const WalletTransaction({
    required this.transactionId,
    required this.amount,
    this.currency = 'EGP',
    required this.date,
    required this.time,
    required this.type,
    this.description,
  });

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
    if (isToday) return 'today';
    if (isYesterday) return 'yesterday';
    return 'older';
  }

  String get formattedAmount {
    final sign = type == TransactionType.credit ? '+' : '-';
    return '$sign${amount.toStringAsFixed(0)} $currency';
  }

  String get formattedDate {
    if (isToday) {
      return time; // Show time for today's transactions
    } else {
      return '${date.day} ${_getMonthName(date.month)} ${date.year}';
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      transactionId: json['transactionId'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'EGP',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      time: json['time'] ?? '',
      type: TransactionType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => TransactionType.credit,
      ),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'amount': amount,
      'currency': currency,
      'date': date.toIso8601String(),
      'time': time,
      'type': type.toString(),
      'description': description,
    };
  }
}

enum TransactionType {
  credit, // Positive amount (earnings, deposits)
  debit, // Negative amount (withdrawals, fees)
}
