import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/features/earnings/presentation/cubit/earning_entry.dart';
import 'package:baqaltydeliveryapp/features/earnings/presentation/widget/earning_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EarningsSection extends StatelessWidget {
  final String title;
  final List<EarningEntry> earnings;
  final Function(EarningEntry)? onCardTap;

  const EarningsSection({
    super.key,
    required this.title,
    required this.earnings,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    if (earnings.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        ...earnings.map(
          (earning) => EarningCard(earning: earning, onTap: onCardTap),
        ),
      ],
    );
  }
}
