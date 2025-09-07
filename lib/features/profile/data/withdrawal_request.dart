class WithdrawalRequest {
  final String id;
  final double amount;
  final String currency;
  final String bankAccountId;
  final DateTime requestDate;
  final WithdrawalStatus status;
  final String? notes;

  const WithdrawalRequest({
    required this.id,
    required this.amount,
    this.currency = 'EGP',
    required this.bankAccountId,
    required this.requestDate,
    this.status = WithdrawalStatus.pending,
    this.notes,
  });

  factory WithdrawalRequest.fromJson(Map<String, dynamic> json) {
    return WithdrawalRequest(
      id: json['id'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'EGP',
      bankAccountId: json['bankAccountId'] ?? '',
      requestDate: DateTime.parse(
        json['requestDate'] ?? DateTime.now().toIso8601String(),
      ),
      status: WithdrawalStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => WithdrawalStatus.pending,
      ),
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'currency': currency,
      'bankAccountId': bankAccountId,
      'requestDate': requestDate.toIso8601String(),
      'status': status.toString(),
      'notes': notes,
    };
  }

  String get formattedAmount {
    return '${amount.toStringAsFixed(0)} $currency';
  }
}

enum WithdrawalStatus { pending, processing, completed, failed, cancelled }

extension WithdrawalStatusExtension on WithdrawalStatus {
  String get displayName {
    switch (this) {
      case WithdrawalStatus.pending:
        return 'Pending';
      case WithdrawalStatus.processing:
        return 'Processing';
      case WithdrawalStatus.completed:
        return 'Completed';
      case WithdrawalStatus.failed:
        return 'Failed';
      case WithdrawalStatus.cancelled:
        return 'Cancelled';
    }
  }
}
