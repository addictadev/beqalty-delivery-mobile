import 'bank_account.dart';

class SampleBankAccounts {
  static List<BankAccount> getSampleBankAccounts() {
    return [
      const BankAccount(
        id: '1',
        accountHolderName: 'Abdallah Ibrahim',
        maskedAccountNumber: 'EGxxxxxxxxxxxxxxxxxx1234',
        cardType: BankCardType.paypal,
        isDefault: true,
      ),
      const BankAccount(
        id: '2',
        accountHolderName: 'Abdallah Ibrahim',
        maskedAccountNumber: 'EGxxxxxxxxxxxxxxxxxx1217',
        cardType: BankCardType.mastercard,
        isDefault: false,
      ),
      const BankAccount(
        id: '3',
        accountHolderName: 'Abdallah Ibrahim',
        maskedAccountNumber: 'EGxxxxxxxxxxxxxxxxxx1252',
        cardType: BankCardType.mastercard,
        isDefault: false,
      ),
    ];
  }

  static BankAccount? getDefaultAccount() {
    final accounts = getSampleBankAccounts();
    try {
      return accounts.firstWhere((account) => account.isDefault);
    } catch (e) {
      return accounts.isNotEmpty ? accounts.first : null;
    }
  }

  static BankAccount? getAccountById(String id) {
    final accounts = getSampleBankAccounts();
    try {
      return accounts.firstWhere((account) => account.id == id);
    } catch (e) {
      return null;
    }
  }
}
