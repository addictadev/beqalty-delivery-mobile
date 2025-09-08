import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/features/profile/presentation/view/my_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/navigation_services/navigation_manager.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_stats_card.dart';
import '../widgets/profile_menu_item.dart';
import 'my_account_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileHeaderBackground,

      appBar: CustomAppBar(
        title: 'profile'.tr(),
        titleColor: AppColors.white,
        titleStyle: TextStyles.textViewMedium16.copyWith(
          color: AppColors.white,
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'edit_profile'.tr(),
              style: TextStyles.textViewMedium16.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ProfileHeader(
            name: 'Donye Collins',
            email: 'lamcollinsdonye@gmail.com',
            profileImageUrl: null,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsivePadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ProfileStatsCard(
                    title: '4.7 Stars',
                    subtitle: 'ratings'.tr(),
                    icon: Icons.star,
                    iconColor: Colors.amber,
                  ),
                ),
                SizedBox(width: context.responsiveMargin),
                Expanded(
                  child: ProfileStatsCard(
                    title: '10 Orders',
                    subtitle: 'today'.tr(),
                  ),
                ),
                SizedBox(width: context.responsiveMargin),
                Expanded(
                  child: ProfileStatsCard(
                    title: '30 Orders',
                    subtitle: 'completed'.tr(),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: context.responsiveMargin * 2),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.profileMenuBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.responsiveBorderRadius * 2),
                  topRight: Radius.circular(context.responsiveBorderRadius * 2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(context.responsivePadding),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      icon: AppAssets.profileUserIcon,
                      title: 'my_account'.tr(),
                      onTap: () {
                        NavigationManager.navigateTo(const MyAccountScreen());
                      },
                    ),
                    ProfileMenuItem(
                      icon: AppAssets.profileWalletIcon,
                      title: 'my_wallet'.tr(),
                      onTap: () {
                        NavigationManager.navigateTo(const MyWalletScreen());
                      },
                    ),
                    ProfileMenuItem(
                      icon: AppAssets.profilSettingsIcon,
                      title: 'settings'.tr(),
                      onTap: () {
                        NavigationManager.navigateTo(const SettingsScreen());
                      },
                    ),
                    ProfileMenuItem(
                      icon: AppAssets.profilHelpIcon,
                      title: 'help_center'.tr(),
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: AppAssets.profilContactIcon,
                      title: 'contact'.tr(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
