import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/features/earnings/presentation/cubit/earning_entry.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EarningCard extends StatelessWidget {
  final EarningEntry earning;
  final Function(EarningEntry)? onTap;

  const EarningCard({
    super.key,
    required this.earning,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.earningsCardShadow,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap != null ? () => onTap!(earning) : null,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLeftSection(context),
                _buildRightSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          earning.orderId,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          earning.time,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildRightSection(BuildContext context) {
    return Text(
      '+${earning.amount.toStringAsFixed(0)} EGP',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.earningsGreen,
      ),
    );
  }
}
