import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/features/history/data/history_entry.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HistoryOrderCard extends StatelessWidget {
  final HistoryEntry entry;
  final VoidCallback? onTap;

  const HistoryOrderCard({super.key, required this.entry, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsiveMargin * 2),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Order ID, Items count, and Status
                Row(
                  children: [
                    // Order ID
                    Expanded(
                      child: Text(
                        entry.orderId,
                        style: TextStyles.textViewBold16.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    // Items count badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.responsivePadding * 0.75,
                        vertical: context.responsiveMargin * 0.5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.borderLight,
                        borderRadius: BorderRadius.circular(
                          context.responsiveBorderRadius * 0.5,
                        ),
                      ),
                      child: Text(
                        '${entry.itemsCount} items',
                        style: TextStyles.textViewMedium12.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),

                    SizedBox(width: context.responsiveMargin),

                    // Status badge
                    _buildStatusBadge(context),
                  ],
                ),

                SizedBox(height: context.responsiveMargin * 1.5),

                // Store information row
                _buildInfoRow(
                  context,
                  icon: Iconsax.shop,
                  text: '${entry.storeName} • ${entry.storeDistance}',
                ),

                SizedBox(height: context.responsiveMargin),

                // Delivery location row
                _buildInfoRow(
                  context,
                  icon: Iconsax.location,
                  text: '${entry.deliveryLocation} • ${entry.deliveryDistance}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (entry.status.toLowerCase()) {
      case 'delivered':
        backgroundColor = const Color(0xFFE8F5E9); // Light green
        textColor = const Color(0xFF4CAF50); // Green
        break;
      case 'failed':
        backgroundColor = const Color(0xFFFFEBEE); // Light red
        textColor = const Color(0xFFF44336); // Red
        break;
      default:
        backgroundColor = AppColors.borderLight;
        textColor = AppColors.textSecondary;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsivePadding * 0.75,
        vertical: context.responsiveMargin * 0.5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          context.responsiveBorderRadius * 0.5,
        ),
      ),
      child: Text(
        entry.status.toUpperCase(),
        style: TextStyles.textViewMedium12.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: context.responsiveIconSize * 0.8,
          color: AppColors.textSecondary,
        ),
        SizedBox(width: context.responsiveMargin),
        Expanded(
          child: Text(
            text,
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
