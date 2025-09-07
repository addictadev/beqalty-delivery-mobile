import 'wallet_transaction.dart';

class SampleWalletTransactions {
  static List<WalletTransaction> getSampleTransactions() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    return [
      // Today's transactions
      WalletTransaction(
        transactionId: '#BAQ10247',
        amount: 225.0,
        currency: 'EGP',
        date: today,
        time: '12:03 AM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),
      WalletTransaction(
        transactionId: '#BAQ10248',
        amount: 1540.0,
        currency: 'EGP',
        date: today,
        time: '1:15 PM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),
      WalletTransaction(
        transactionId: '#BAQ10249',
        amount: 798.0,
        currency: 'EGP',
        date: today,
        time: '3:45 PM',
        type: TransactionType.debit,
        description: 'Withdrawal',
      ),

      // Yesterday's transactions
      WalletTransaction(
        transactionId: '#BAQ10248',
        amount: 105.0,
        currency: 'EGP',
        date: yesterday,
        time: '2:30 PM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),
      WalletTransaction(
        transactionId: '#BAQ10247',
        amount: 320.0,
        currency: 'EGP',
        date: yesterday,
        time: '11:20 AM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),
      WalletTransaction(
        transactionId: '#BAQ10246',
        amount: 150.0,
        currency: 'EGP',
        date: yesterday,
        time: '9:15 AM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),

      // Older transactions
      WalletTransaction(
        transactionId: '#BAQ10245',
        amount: 450.0,
        currency: 'EGP',
        date: yesterday.subtract(const Duration(days: 1)),
        time: '4:00 PM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),
      WalletTransaction(
        transactionId: '#BAQ10244',
        amount: 200.0,
        currency: 'EGP',
        date: yesterday.subtract(const Duration(days: 2)),
        time: '1:30 PM',
        type: TransactionType.credit,
        description: 'Delivery earnings',
      ),
    ];
  }

  static List<WalletTransaction> getTodayTransactions() {
    return getSampleTransactions().where((t) => t.isToday).toList();
  }

  static List<WalletTransaction> getYesterdayTransactions() {
    return getSampleTransactions().where((t) => t.isYesterday).toList();
  }

  static List<WalletTransaction> getOlderTransactions() {
    return getSampleTransactions()
        .where((t) => !t.isToday && !t.isYesterday)
        .toList();
  }

  static List<WalletTransaction> searchTransactions(String query) {
    if (query.isEmpty) return getSampleTransactions();

    return getSampleTransactions().where((transaction) {
      return transaction.transactionId.toLowerCase().contains(
            query.toLowerCase(),
          ) ||
          transaction.description?.toLowerCase().contains(
                query.toLowerCase(),
              ) ==
              true;
    }).toList();
  }
}
