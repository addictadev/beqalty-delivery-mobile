import 'package:baqaltydeliveryapp/features/earnings/domain/models/earning_entry.dart';

class SampleEarnings {
  static List<EarningEntry> getSampleEarnings() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    return [
      // Today's earnings
      EarningEntry(
        orderId: '#BAQ10247',
        time: '12:03 AM',
        amount: 57,
        date: today,
      ),
      EarningEntry(
        orderId: '#BAQ10248',
        time: '1:15 PM',
        amount: 45,
        date: today,
      ),
      EarningEntry(
        orderId: '#BAQ10249',
        time: '3:45 PM',
        amount: 34,
        date: today,
      ),
      
      // Yesterday's earnings
      EarningEntry(
        orderId: '#BAQ10247',
        time: '12:03 AM',
        amount: 57,
        date: yesterday,
      ),
      EarningEntry(
        orderId: '#BAQ10248',
        time: '1:15 PM',
        amount: 45,
        date: yesterday,
      ),
      EarningEntry(
        orderId: '#BAQ10249',
        time: '3:45 PM',
        amount: 34,
        date: yesterday,
      ),
    ];
  }

  static List<EarningEntry> getEarningsByDate(String dateLabel) {
    final earnings = getSampleEarnings();
    return earnings.where((earning) => earning.dateLabel == dateLabel).toList();
  }

  static double getTotalEarnings() {
    final earnings = getSampleEarnings();
    return earnings.fold(0, (sum, earning) => sum + earning.amount);
  }

  static double getTotalEarningsByDate(String dateLabel) {
    final earnings = getEarningsByDate(dateLabel);
    return earnings.fold(0, (sum, earning) => sum + earning.amount);
  }
}
