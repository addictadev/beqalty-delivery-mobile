import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/navigation_services/navigation_manager.dart';
import '../widgets/settings_menu_item.dart';
import 'privacy_policy_screen.dart';
import 'change_password_screen.dart';
import 'notifications_screen.dart';
import 'language_selection_bottom_sheet.dart';
import '../../../../core/widgets/logout_confirmation_dialog.dart';
import '../../../../core/widgets/delete_account_confirmation_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.responsivePadding),
          child: Column(
            children: [
              SizedBox(height: context.responsiveMargin),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(icon: Icons.chevron_left, size: 40),
                  Text(
                    'settings'.tr(),
                    style: TextStyles.textViewMedium18.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              SizedBox(height: context.responsiveMargin * 4),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader(context, "general".tr()),
                      SizedBox(height: context.responsiveMargin),

                      _buildGeneralSection(context),

                      SizedBox(height: context.responsiveMargin * 3),

                      _buildSectionHeader(context, "security".tr()),
                      SizedBox(height: context.responsiveMargin),

                      _buildSecuritySection(context),

                      SizedBox(height: context.responsiveMargin * 4),

                      _buildLogoutButton(context),

                      SizedBox(height: context.responsiveMargin * 3),

                      _buildFooter(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsivePadding),
      child: Text(
        title,
        style: TextStyles.textViewMedium16.copyWith(
          color: AppColors.textLight,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildGeneralSection(BuildContext context) {
    return Column(
      children: [
        SettingsMenuItem(
          title: "reset_password".tr(),
          onTap: () {
            NavigationManager.navigateTo(const ChangePasswordScreen());
          },
        ),
        SettingsMenuItem(
          title: "notifications".tr(),
          onTap: () {
            NavigationManager.navigateTo(const NotificationsScreen());
          },
        ),
        SettingsMenuItem(
          title: "language".tr(),
          onTap: () {
            _showLanguageSelectionBottomSheet(context);
          },
        ),
        SettingsMenuItem(
          title: "delete_account".tr(),
          type: SettingsMenuItemType.destructive,
          showArrow: false,
          onTap: () {
            _showDeleteAccountDialog(context);
          },
        ),
      ],
    );
  }

  Widget _buildSecuritySection(BuildContext context) {
    return SettingsMenuItem(
      title: "privacy_policy".tr(),
      subtitle: "privacy_policy_sub".tr(),
      type: SettingsMenuItemType.withSubtitle,
      onTap: () {
        NavigationManager.navigateTo(const PrivacyPolicyScreen());
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.responsiveBorderRadius * 6),
      onTap: () {
        _showLogoutDialog(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.responsivePadding,
          vertical: context.responsivePadding,
        ),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackground,
          borderRadius: BorderRadius.circular(
            context.responsiveBorderRadius * 6,
          ),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
        ),
        child: Center(
          child: Text(
            "logout".tr(),
            style: TextStyles.textViewBold16.copyWith(
              color: AppColors.error,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Text(
        "copyright".tr(),
        style: TextStyles.textViewRegular12.copyWith(
          color: AppColors.textLight,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  void _showLanguageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const LanguageSelectionBottomSheet();
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LogoutConfirmationDialog(
          onConfirm: () {
          },
          onCancel: () {
            
          },
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DeleteAccountConfirmationDialog(
          onConfirm: () {
          },
          onCancel: () {
            
          },
        );
      },
    );
  }


}
