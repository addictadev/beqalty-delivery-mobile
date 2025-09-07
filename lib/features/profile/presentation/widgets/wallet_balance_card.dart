import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';

class WalletBalanceCard extends StatelessWidget {
  final double balance;
  final String currency;
  final VoidCallback? onWithdraw;
  final bool isLoading;

  const WalletBalanceCard({
    super.key,
    required this.balance,
    this.currency = 'EGP',
    this.onWithdraw,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.responsivePadding),
      padding: EdgeInsets.all(context.responsivePadding),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${balance.toStringAsFixed(0)} $currency',
                  style: TextStyles.textViewBold24.copyWith(
                    color: AppColors.white,
                    fontSize: 8.w,
                    height: 1.1,
                  ),
                ),

                SizedBox(height: context.responsiveMargin * 0.5),

                Text(
                  'your_balance'.tr(),
                  style: TextStyles.textViewRegular14.copyWith(
                    color: AppColors.white.withValues(alpha: 0.8),
                    fontSize: 3.5.w,
                  ),
                ),
              ],
            ),
          ),

          Expanded(flex: 1, child: _buildWithdrawButton(context)),
        ],
      ),
    );
  }

  Widget _buildWithdrawButton(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onWithdraw,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsiveMargin,
          vertical: context.responsiveMargin * 1.2,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            context.responsiveBorderRadius * 4,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(context.responsiveMargin * 0.5),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.swap_horiz,
                color: AppColors.primary,
                size: 4.w,
              ),
            ),

            SizedBox(width: context.responsiveMargin * 0.5),

            Flexible(
              child: Text(
                'withdraw'.tr(),
                style: TextStyles.textViewMedium14.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 3.2.w,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
