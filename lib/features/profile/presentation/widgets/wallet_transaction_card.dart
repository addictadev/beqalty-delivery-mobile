import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../data/wallet_transaction.dart';

class WalletTransactionCard extends StatelessWidget {
  final WalletTransaction transaction;
  final VoidCallback? onTap;

  const WalletTransactionCard({
    super.key,
    required this.transaction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsiveMargin * 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
          child: Padding(
            padding: EdgeInsets.all(context.responsivePadding),
            child: Row(
              children: [
                // Left side - Transaction info
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Transaction ID
                      Text(
                        transaction.transactionId,
                        style: TextStyles.textViewBold16.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 4.w,
                        ),
                      ),

                      SizedBox(height: context.responsiveMargin * 0.3),

                      // Date/Time
                      Text(
                        transaction.formattedDate,
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 3.2.w,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right side - Amount
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      transaction.formattedAmount,
                      style: TextStyles.textViewBold16.copyWith(
                        color: _getAmountColor(),
                        fontSize: 4.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getAmountColor() {
    return transaction.type == TransactionType.credit
        ? AppColors
              .success // Green for positive amounts
        : AppColors.error; // Red for negative amounts
  }
}
