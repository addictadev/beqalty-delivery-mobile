import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/wallet_transaction_section.dart';
import '../../data/sample_wallet_transactions.dart';
import '../../data/wallet_transaction.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final double _balance = 5165.0;
  List<WalletTransaction> _transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    setState(() {
      _transactions = SampleWalletTransactions.getSampleTransactions();
    });
  }

  void _onTransactionTap(WalletTransaction transaction) {
    // Handle transaction tap - could show details, navigate, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${transaction.transactionId} - ${transaction.formattedAmount}',
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileHeaderBackground,
      body: Column(
        children: [
          SizedBox(height: context.responsiveMargin * 4),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsivePadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(
                  icon: Icons.chevron_left,
                  size: 40,
                  color: Colors.grey.withValues(alpha: 0.2),
                  iconColor: AppColors.white,
                ),
                Text(
                  'my_wallet'.tr(),
                  style: TextStyles.textViewBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                CustomBackButton(
                  icon: Icons.support_agent,
                  size: 40,
                  color: Colors.grey.withValues(alpha: 0.2),
                  iconColor: AppColors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: context.responsiveMargin * 4),

          WalletBalanceCard(balance: _balance, currency: 'EGP'),

          SizedBox(height: context.responsiveMargin * 4),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.responsiveBorderRadius * 3),
                  topRight: Radius.circular(context.responsiveBorderRadius * 3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: _buildTransactionHistory(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory() {
    if (_transactions.isEmpty) {
      return _buildEmptyState();
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(context.responsivePadding),
      child: Column(
        children: [
          // Today's transactions
          WalletTransactionSection(
            title: 'today',
            transactions: _transactions.where((t) => t.isToday).toList(),
            onTransactionTap: _onTransactionTap,
          ),

          // Yesterday's transactions
          WalletTransactionSection(
            title: 'yesterday',
            transactions: _transactions.where((t) => t.isYesterday).toList(),
            onTransactionTap: _onTransactionTap,
          ),

          // Older transactions
          if (_transactions.any((t) => !t.isToday && !t.isYesterday))
            WalletTransactionSection(
              title: 'older',
              transactions: _transactions
                  .where((t) => !t.isToday && !t.isYesterday)
                  .toList(),
              onTransactionTap: _onTransactionTap,
            ),

          // Add some bottom padding
          SizedBox(height: context.responsiveMargin * 4),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: context.responsiveIconSize * 3,
            color: AppColors.textLight,
          ),
          SizedBox(height: context.responsiveMargin * 2),
          Text(
            "no_transactions_found".tr(),
            style: TextStyles.textViewMedium18.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.responsiveMargin),
          Text(
            "start_earning_message".tr(),
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
