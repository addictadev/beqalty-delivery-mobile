import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/features/history/data/history_entry.dart';
import 'package:baqaltydeliveryapp/features/history/presentation/widget/history_order_card.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

class HistorySection extends StatelessWidget {
  final String title;
  final List<HistoryEntry> historyEntries;
  final Function(HistoryEntry)? onCardTap;

  const HistorySection({
    super.key,
    required this.title,
    required this.historyEntries,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    if (historyEntries.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            title.tr(),
            style: TextStyles.textViewSemiBold14.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        ...historyEntries.map(
          (entry) => HistoryOrderCard(
            entry: entry,
            onTap: onCardTap != null ? () => onCardTap!(entry) : null,
          ),
        ),
      ],
    );
  }
}
