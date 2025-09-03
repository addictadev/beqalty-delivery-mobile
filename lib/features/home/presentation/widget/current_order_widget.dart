import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/core/images_preview/custom_svg_img.dart';
import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

/// 🚀 CI/CD: This widget is now part of our automated build pipeline!
/// Every push will trigger automatic APK building and WhatsApp notifications.
/// 📱 WhatsApp integration ready with phone number: +201156165689
/// ✅ Flutter 3.19.0 compatible - SDK requirement ^3.9.0
class CurrentOrderWidget extends StatelessWidget {
  final VoidCallback? onContactPressed;

  final VoidCallback? onNavigatePressed;

  final VoidCallback? onDeliveredPressed;

  final String orderNumber;

  final String route;

  final String timeRemaining;

  final double progressPercentage;

  const CurrentOrderWidget({
    super.key,
    this.onContactPressed,
    this.onNavigatePressed,
    this.onDeliveredPressed,
    this.orderNumber = "BAQ10245",
    this.route = "McDonald's → Maadi",
    this.timeRemaining = "12 min left",
    this.progressPercentage = 0.75,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _buildContainerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderDetailsHeader(context),
          _buildRouteAndTimeSection(context),
          _buildActionButtons(context),
          _buildDeliveredButton(context),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  Widget _buildOrderDetailsHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildOrderInfoSection(context), _buildStatusTag(context)],
      ),
    );
  }

  Widget _buildOrderInfoSection(BuildContext context) {
    return Row(
      children: [
        _buildMotorcycleIcon(context),
        SizedBox(width: 12),
        _buildOrderNumberText(context),
      ],
    );
  }

  Widget _buildMotorcycleIcon(BuildContext context) {
    return CustomSvgImage(
      assetName: AppAssets.motorcycleIcon,
      width: context.responsiveIconSize,
      height: context.responsiveIconSize,
    );
  }

  Widget _buildOrderNumberText(BuildContext context) {
    return Text(
      "order_number".tr().replaceAll("BAQ10245", orderNumber),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildStatusTag(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "out_for_delivery".tr(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.success,
          letterSpacing: -0.2,
        ),
      ),
    );
  }

  Widget _buildRouteAndTimeSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: _buildRouteSectionDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRouteAndTimeRow(context),
          SizedBox(height: 20),
          _buildProgressBar(context),
        ],
      ),
    );
  }

  BoxDecoration _buildRouteSectionDecoration() {
    return BoxDecoration(
      color: Colors.grey.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(16),
    );
  }

  Widget _buildRouteAndTimeRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildRouteText(context), _buildTimeRemainingText(context)],
    );
  }

  Widget _buildRouteText(BuildContext context) {
    return Text(
      "route_mcdonalds_maadi".tr(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        letterSpacing: -0.2,
        height: 1.2,
      ),
    );
  }

  Widget _buildTimeRemainingText(BuildContext context) {
    return Text(
      "time_remaining".tr(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        letterSpacing: -0.2,
        height: 1.2,
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progressPercentage,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.success,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              icon: Iconsax.call5,
              text: "contact".tr(),
              onTap: onContactPressed,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _buildActionButton(
              icon: Iconsax.location5,
              text: "navigate".tr(),
              onTap: onNavigatePressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: _buildActionButtonDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.white, size: 20),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildActionButtonDecoration() {
    return BoxDecoration(
      color: Colors.grey.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(16),
    );
  }

  Widget _buildDeliveredButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: _buildDeliveredButtonDecoration(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onDeliveredPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, color: AppColors.black, size: 24),
                SizedBox(width: 12),
                Text(
                  "delivered".tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.trackingDarkGray,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDeliveredButtonDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
