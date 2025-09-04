import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class EarningsSearchBar extends StatelessWidget {
  final VoidCallback? onTap;

  const EarningsSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 12.h,
      decoration: BoxDecoration(
        color: AppColors.earningsSearchBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.earningsSearchBorder, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Icon(
                  Iconsax.search_normal,
                  size: 5.w,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Text(
                    'Search Earnings',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
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
}
