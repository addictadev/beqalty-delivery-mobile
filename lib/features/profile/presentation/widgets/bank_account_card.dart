import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../data/bank_account.dart';

class BankAccountCard extends StatelessWidget {
  final BankAccount bankAccount;
  final bool isSelected;
  final VoidCallback onTap;

  const BankAccountCard({
    super.key,
    required this.bankAccount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsiveMargin * 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.borderLight,
          width: isSelected ? 2 : 1,
        ),
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
                // Bank logo
                _buildBankLogo(context),

                SizedBox(width: context.responsiveMargin * 1.5),

                // Account details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bankAccount.accountHolderName,
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 3.2.w,
                        ),
                      ),
                      SizedBox(height: context.responsiveMargin * 0.3),
                      Text(
                        bankAccount.maskedAccountNumber,
                        style: TextStyles.textViewMedium16.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 4.w,
                        ),
                      ),
                    ],
                  ),
                ),

                // Radio button
                _buildRadioButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBankLogo(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
          context.responsiveBorderRadius * 0.8,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.account_balance_wallet,
          color: AppColors.primary,
          size: 6.w,
        ),
      ),
    );
  }

  Widget _buildRadioButton(BuildContext context) {
    return Container(
      width: 6.w,
      height: 6.w,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.borderLight,
          width: 2,
        ),
      ),
      child: isSelected
          ? Icon(Icons.check, color: AppColors.white, size: 3.5.w)
          : null,
    );
  }
}
