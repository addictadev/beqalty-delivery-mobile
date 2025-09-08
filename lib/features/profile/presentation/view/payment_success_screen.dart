import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/core/images_preview/custom_svg_img.dart';
import 'package:baqaltydeliveryapp/core/navigation_services/navigation_manager.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/features/profile/presentation/view/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../../core/theme/app_colors.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.celebrateImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.responsivePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildSuccessCard(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(AppAssets.ticketImg, fit: BoxFit.contain),
            ),
          ),

          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: context.responsiveMargin * 2),
                  CustomSvgImage(assetName: AppAssets.sucessIcon),

                  SizedBox(height: context.responsiveMargin * 2),

                  Text(
                    "withdraw_success".tr(),
                    style: TextStyles.textViewBold24.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: context.responsiveMargin),

                  Text(
                    "withdraw_success_description".tr(),
                    style: TextStyles.textViewRegular16.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),

                  SizedBox(height: context.responsiveMargin * 3),

                  Column(
                    children: [
                      Text(
                        "total_payment".tr(),
                        style: TextStyles.textViewRegular14.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: context.responsiveMargin * 0.8),
                      Text(
                        "1400 EGP",
                        style: TextStyles.textViewBold24.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 32,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: context.responsiveMargin * 8),

                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: () {
                              NavigationManager.navigateTo(
                                const PrivacyPolicyScreen(),
                              );
                            },
                            child: Center(
                              child: Text(
                                "next".tr(),
                                style: TextStyles.textViewBold16.copyWith(
                                  color: AppColors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
