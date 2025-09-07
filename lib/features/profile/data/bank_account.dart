class BankAccount {
  final String id;
  final String accountHolderName;
  final String maskedAccountNumber;
  final BankCardType cardType;
  final String? logoUrl;
  final bool isDefault;

  const BankAccount({
    required this.id,
    required this.accountHolderName,
    required this.maskedAccountNumber,
    required this.cardType,
    this.logoUrl,
    this.isDefault = false,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      id: json['id'] ?? '',
      accountHolderName: json['accountHolderName'] ?? '',
      maskedAccountNumber: json['maskedAccountNumber'] ?? '',
      cardType: BankCardType.values.firstWhere(
        (e) => e.toString() == json['cardType'],
        orElse: () => BankCardType.other,
      ),
      logoUrl: json['logoUrl'],
      isDefault: json['isDefault'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountHolderName': accountHolderName,
      'maskedAccountNumber': maskedAccountNumber,
      'cardType': cardType.toString(),
      'logoUrl': logoUrl,
      'isDefault': isDefault,
    };
  }
}

enum BankCardType { paypal, mastercard, visa, other }

extension BankCardTypeExtension on BankCardType {
  String get displayName {
    switch (this) {
      case BankCardType.paypal:
        return 'PayPal';
      case BankCardType.mastercard:
        return 'Mastercard';
      case BankCardType.visa:
        return 'Visa';
      case BankCardType.other:
        return 'Other';
    }
  }

  String get logoPath {
    switch (this) {
      case BankCardType.paypal:
        return 'assets/icons/paypal_logo.svg';
      case BankCardType.mastercard:
        return 'assets/icons/mastercard_logo.svg';
      case BankCardType.visa:
        return 'assets/icons/visa_logo.svg';
      case BankCardType.other:
        return 'assets/icons/bank_logo.svg';
    }
  }
}
