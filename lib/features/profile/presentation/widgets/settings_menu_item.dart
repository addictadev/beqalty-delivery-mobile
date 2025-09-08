import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';

enum SettingsMenuItemType { normal, destructive, withSubtitle }

class SettingsMenuItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final SettingsMenuItemType type;
  final bool showArrow;
  final bool showDivider;

  const SettingsMenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.type = SettingsMenuItemType.normal,
    this.showArrow = true,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsivePadding,
                vertical: context.responsiveMargin * 2,
              ),
              child: Row(
                children: [
                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: _getTitleStyle(context)),
                        if (subtitle != null) ...[
                          SizedBox(height: context.responsiveMargin * 0.3),
                          Text(
                            subtitle!,
                            style: TextStyles.textViewRegular14.copyWith(
                              color: AppColors.textLight,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Arrow Icon (if enabled and not destructive)
                  if (showArrow && type != SettingsMenuItemType.destructive)
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.textLight,
                      size: context.responsiveIconSize * 0.8,
                    ),
                ],
              ),
            ),
          ),
        ),

        // Divider
        if (showDivider)
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.responsivePadding),
            height: 1,
            color: AppColors.borderLight,
          ),
      ],
    );
  }

  TextStyle _getTitleStyle(BuildContext context) {
    switch (type) {
      case SettingsMenuItemType.destructive:
        return TextStyles.textViewMedium16.copyWith(
          color: AppColors.error,
          fontSize: 15.sp,
        );
      case SettingsMenuItemType.withSubtitle:
        return TextStyles.textViewMedium16.copyWith(
          color: AppColors.textPrimary,
          fontSize: 15.sp,
        );
      case SettingsMenuItemType.normal:
        return TextStyles.textViewMedium16.copyWith(
          color: AppColors.textPrimary,
          fontSize: 15.sp,
        );
    }
  }
}
