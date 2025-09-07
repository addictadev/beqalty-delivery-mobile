import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../data/wallet_transaction.dart';
import 'wallet_transaction_card.dart';

class WalletTransactionSection extends StatelessWidget {
  final String title;
  final List<WalletTransaction> transactions;
  final Function(WalletTransaction)? onTransactionTap;

  const WalletTransactionSection({
    super.key,
    required this.title,
    required this.transactions,
    this.onTransactionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.responsiveMargin * 1.5,
          ),
          child: Text(
            title.tr(),
            style: TextStyles.textViewSemiBold14.copyWith(
              color: AppColors.textSecondary,
              fontSize: 3.5.w,
            ),
          ),
        ),

        // Transaction cards
        ...transactions.map(
          (transaction) => WalletTransactionCard(
            transaction: transaction,
            onTap: () => () {},
          ),
        ),
      ],
    );
  }
}
