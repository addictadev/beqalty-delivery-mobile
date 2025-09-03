import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/core/images_preview/custom_svg_img.dart';
import 'package:baqaltydeliveryapp/core/navigation_services/navigation_manager.dart';
import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/features/auth/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:baqaltydeliveryapp/core/widgets/primary_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SucessRegisterScreen extends StatefulWidget {
  const SucessRegisterScreen({super.key});

  @override
  State<SucessRegisterScreen> createState() => _SucessRegisterScreenState();
}

class _SucessRegisterScreenState extends State<SucessRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
            image: AssetImage(AppAssets.celebrateImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [Center(child: _buildModalDialog())]),
      ),
    );
  }

  Widget _buildModalDialog() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          _buildIcon(),

          SizedBox(height: 24),

          // Title
          _buildTitle(),

          SizedBox(height: 16),

          // Description
          _buildDescription(),

          SizedBox(height: 32),

          // Button
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return CustomSvgImage(assetName: AppAssets.underReviewImg);
  }

  Widget _buildTitle() {
    return Text(
      "your_account_under_review".tr(),
      textAlign: TextAlign.center,
      style: GoogleFonts.robotoFlex(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        height: 1.2,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      "reviewing_details_notification".tr(),
      textAlign: TextAlign.center,
      style: GoogleFonts.robotoFlex(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
        height: 1.3,
      ),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: PrimaryButton(
        text: "back_to_login".tr(),
        onPressed: () {
        NavigationManager.navigateToAndFinish(LoginScreen());
        },
      ),
    );
  }
}
