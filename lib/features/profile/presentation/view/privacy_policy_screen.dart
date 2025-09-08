import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.responsivePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.responsiveMargin),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(icon: Icons.chevron_left, size: 40),
                ],
              ),
              SizedBox(height: context.responsiveMargin * 4),

              _buildVersionBadge(context),

              SizedBox(height: context.responsiveMargin * 2),

              _buildTitle(context),

              SizedBox(height: context.responsiveMargin),

              _buildEffectiveDate(context),

              SizedBox(height: context.responsiveMargin * 2),

              _buildDownloadButton(context),

              SizedBox(height: context.responsiveMargin * 3),

              _buildIntroduction(context),

              SizedBox(height: context.responsiveMargin * 3),

              _buildSection1(context),

              SizedBox(height: context.responsiveMargin * 3),

              _buildSection2(context),

              SizedBox(height: context.responsiveMargin * 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVersionBadge(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsivePadding * 1.5,
          vertical: context.responsiveMargin * 0.8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: Text(
          "v2.5.2",
          style: TextStyles.textViewMedium14.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        "privacy_policy".tr(),
        style: TextStyles.textViewBold24.copyWith(
          color: AppColors.textPrimary,
          fontSize: context.isMobile ? 22.sp : 28.sp,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildEffectiveDate(BuildContext context) {
    return Center(
      child: Text(
        "effective_date".tr(),
        style: TextStyles.textViewRegular16.copyWith(
          color: AppColors.textSecondary,
          fontSize: 14.sp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsivePadding,
          vertical: context.responsivePadding,
        ),
        decoration: BoxDecoration(
          color: AppColors.overlayGray3,
          borderRadius: BorderRadius.circular(
            context.responsiveBorderRadius * 4,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.download,
                  color: AppColors.primary,
                  size: context.responsiveIconSize * 0.8,
                ),
                SizedBox(width: context.responsiveMargin),
                Text(
                  "download_as_pdf".tr(),
                  style: TextStyles.textViewMedium16.copyWith(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntroduction(BuildContext context) {
    return Text(
      "privacy_policy_intro".tr(),
      style: TextStyles.textViewRegular16.copyWith(
        color: AppColors.textPrimary,
        fontSize: 14.sp,
        height: 1.5,
      ),
    );
  }

  Widget _buildSection1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "information_we_collect".tr(),
          style: TextStyles.textViewBold20.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
          ),
        ),

        SizedBox(height: context.responsiveMargin),

        Text(
          "information_we_collect_intro".tr(),
          style: TextStyles.textViewRegular16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
            height: 1.5,
          ),
        ),

        SizedBox(height: context.responsiveMargin * 1.5),

        _buildBulletPoint(
          context,
          "personal_information".tr(),
          "personal_information_desc".tr(),
        ),

        SizedBox(height: context.responsiveMargin),

        _buildBulletPoint(
          context,
          "delivery_data".tr(),
          "delivery_data_desc".tr(),
        ),

        SizedBox(height: context.responsiveMargin),

        _buildBulletPoint(context, "usage_data".tr(), "usage_data_desc".tr()),

        SizedBox(height: context.responsiveMargin),

        _buildBulletPoint(context, "cookies".tr(), "cookies_desc".tr()),
      ],
    );
  }

  Widget _buildSection2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "how_we_use_information".tr(),
          style: TextStyles.textViewBold20.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
          ),
        ),

        SizedBox(height: context.responsiveMargin),

        Text(
          "how_we_use_intro".tr(),
          style: TextStyles.textViewRegular16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
            height: 1.5,
          ),
        ),

        SizedBox(height: context.responsiveMargin * 1.5),

        _buildSimpleBulletPoint(context, "provide_services".tr()),

        SizedBox(height: context.responsiveMargin * 0.8),

        _buildSimpleBulletPoint(context, "sync_accounts".tr()),

        SizedBox(height: context.responsiveMargin * 0.8),

        _buildSimpleBulletPoint(context, "improve_app".tr()),

        SizedBox(height: context.responsiveMargin * 0.8),

        _buildSimpleBulletPoint(context, "send_notifications".tr()),

        SizedBox(height: context.responsiveMargin * 0.8),

        _buildSimpleBulletPoint(context, "comply_legal".tr()),
      ],
    );
  }

  Widget _buildBulletPoint(
    BuildContext context,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: context.responsiveMargin * 0.3),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: context.responsiveMargin),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.textViewSemiBold16.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: context.responsiveMargin * 0.5),
              Text(
                description,
                style: TextStyles.textViewRegular16.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleBulletPoint(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: context.responsiveMargin * 0.3),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: context.responsiveMargin),
        Expanded(
          child: Text(
            text,
            style: TextStyles.textViewRegular16.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14.sp,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
