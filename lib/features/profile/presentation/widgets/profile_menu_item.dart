import 'package:baqaltydeliveryapp/core/images_preview/custom_svg_img.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
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
                horizontal: context.responsiveMargin,
                vertical: context.responsiveMargin * 1.5,
              ),
              child: Row(
                children: [
                  // Icon Container
                  Container(
                    width: 12.w,
                    height: 12.w,
                    padding: EdgeInsets.all(context.responsiveMargin * 1.6),
                    decoration: BoxDecoration(
                      color: AppColors.overlayGray2,
                      borderRadius: BorderRadius.circular(
                        context.responsiveBorderRadius * 0.8,
                      ),
                    ),
                    child: CustomSvgImage(assetName: icon),
                  ),

                  SizedBox(width: context.responsiveMargin * 1.5),

                  // Title
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyles.textViewMedium16.copyWith(
                        color: AppColors.profileMenuTextColor,
                        fontSize: 4.w,
                      ),
                    ),
                  ),

                  // Arrow Icon
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.textLight,
                    size: 5.w,
                  ),
                ],
              ),
            ),
          ),
        ),

        if (showDivider)
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.responsiveMargin),
            height: 1,
            color: AppColors.profileMenuDividerColor,
          ),
      ],
    );
  }
}
