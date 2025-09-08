import 'package:baqaltydeliveryapp/core/images_preview/custom_svg_img.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';
import '../utils/responsive_utils.dart';
import '../utils/styles/styles.dart';
import '../utils/font_family_utils.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmButtonText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String icon;
  final Color iconColor;
  final Color confirmButtonColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.onConfirm,
    this.onCancel,
    required this.icon,
    required this.iconColor,
    required this.confirmButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.overlayDark,
        child: Center(child: _buildDialogContent(context)),
      ),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    final double dialogWidth = context.isMobile
        ? MediaQuery.of(context).size.width * 0.85
        : context.isTablet
        ? 400
        : 450;

    final double iconSize = context.responsiveIconSize * 2.5;
    final double borderRadius = context.responsiveBorderRadius * 2;
    final EdgeInsets padding = EdgeInsets.all(context.responsivePadding * 1.5);

    return Container(
      width: dialogWidth,
      margin: EdgeInsets.symmetric(horizontal: context.responsivePadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(context, iconSize, icon),
            SizedBox(height: context.responsiveMargin * 5),

            _buildMessage(context),
            SizedBox(height: context.responsiveMargin * 3),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, double iconSize, String icon) {
    return Container(
      width: iconSize * 1.5,
      height: iconSize * 1.5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: CustomSvgImage(
        assetName: icon,
        width: iconSize * 0.8,
        height: iconSize * 0.8,
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Text(
      message,
      style: TextStyles.textViewBold18.copyWith(
        color: AppColors.textPrimary,
        fontSize: 18.sp,
        fontFamily: FontFamilyUtils.getCurrentFontFamily(),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final double buttonHeight = 6.h;
    final double borderRadius = context.responsiveBorderRadius * 1.5;

    return Column(
      children: [
        // Confirm Button
        _buildConfirmButton(context, buttonHeight, borderRadius),
        SizedBox(height: context.responsiveMargin * 2),
        // Cancel Button
        _buildCancelButton(context, buttonHeight, borderRadius),
      ],
    );
  }

  Widget _buildConfirmButton(
    BuildContext context,
    double height,
    double borderRadius,
  ) {
    return Container(
      height: height,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius * 2),
        color: confirmButtonColor,
        boxShadow: [
          BoxShadow(
            color: confirmButtonColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Center(
            child: Text(
              confirmButtonText,
              style: TextStyles.textViewMedium16.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
                fontFamily: FontFamilyUtils.getCurrentFontFamily(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton(
    BuildContext context,
    double height,
    double borderRadius,
  ) {
    return Container(
      height: height,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius * 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: () {
            Navigator.of(context).pop();
            onCancel?.call();
          },
          child: Center(
            child: Text(
              "cancel".tr(),
              style: TextStyles.textViewMedium16.copyWith(
                color: AppColors.textLight,
                fontSize: 16.sp,
                fontFamily: FontFamilyUtils.getCurrentFontFamily(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
