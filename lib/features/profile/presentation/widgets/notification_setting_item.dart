import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/custom_toggle_switch.dart';

class NotificationSettingItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  const NotificationSettingItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsivePadding,
            vertical: context.responsiveMargin * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Expanded(
                child: Text(
                  title,
                  style: TextStyles.textViewMedium16.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                  ),
                ),
              ),

              // Toggle Switch
              CustomToggleSwitch(value: value, onChanged: onChanged),
            ],
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
}
