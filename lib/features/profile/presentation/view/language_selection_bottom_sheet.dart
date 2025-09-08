import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/shared_prefs_helper.dart';
import '../../../../core/utils/font_family_utils.dart';
import '../../../../core/widgets/custom_radio_tile.dart';

class LanguageSelectionBottomSheet extends StatefulWidget {
  const LanguageSelectionBottomSheet({super.key});

  @override
  State<LanguageSelectionBottomSheet> createState() =>
      _LanguageSelectionBottomSheetState();
}

class _LanguageSelectionBottomSheetState
    extends State<LanguageSelectionBottomSheet> {
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  void _loadCurrentLanguage() {
    setState(() {
      _selectedLanguage = SharedPrefsHelper.getLanguage();
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    if (_selectedLanguage == languageCode) return;

    setState(() {
      _selectedLanguage = languageCode;
    });

    // Save language preference
    await SharedPrefsHelper.setLanguage(languageCode);

    // Change language in the app
    await LocalizeAndTranslate.setLanguageCode(languageCode);

    if (mounted) {
      // Show success message with proper font family
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "language_changed".tr(),
            style: TextStyles.textViewMedium16.copyWith(
              color: AppColors.white,
              fontFamily: FontFamilyUtils.getCurrentFontFamily(),
            ),
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
          ),
          margin: EdgeInsets.all(context.responsivePadding),
        ),
      );

      _showRestartDialog(context);
    }
  }

  void _showRestartDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              context.responsiveBorderRadius * 2,
            ),
          ),
          title: Text(
            "restart_required".tr(),
            style: TextStyles.textViewBold18.copyWith(
              color: AppColors.textPrimary,
              fontFamily: FontFamilyUtils.getCurrentFontFamily(),
            ),
          ),
          content: Text(
            "restart_required".tr(),
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textSecondary,
              fontFamily: FontFamilyUtils.getCurrentFontFamily(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close bottom sheet
              },
              child: Text(
                "cancel".tr(),
                style: TextStyles.textViewMedium16.copyWith(
                  color: AppColors.textLight,
                  fontFamily: FontFamilyUtils.getCurrentFontFamily(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close bottom sheet
                // Restart the app
                SystemNavigator.pop();
              },
              child: Text(
                "restart".tr(),
                style: TextStyles.textViewMedium16.copyWith(
                  color: AppColors.primary,
                  fontFamily: FontFamilyUtils.getCurrentFontFamily(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.responsiveBorderRadius * 2),
          topRight: Radius.circular(context.responsiveBorderRadius * 2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: context.responsiveMargin),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(context.responsivePadding),
            child: Text(
              "select_language".tr(),
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
                fontSize: 18.sp,
                fontFamily: FontFamilyUtils.getCurrentFontFamily(),
              ),
            ),
          ),

          CustomRadioTile(
            title: "english".tr(),
            subtitle: "English",
            value: _selectedLanguage == 'en',
            onChanged: (value) => _changeLanguage('en'),
            titleFontFamily: FontFamilyUtils.getFontFamilyForLanguage('en'),
            subtitleFontFamily: FontFamilyUtils.getFontFamilyForLanguage('en'),
          ),

          CustomRadioTile(
            title: "arabic".tr(),
            subtitle: "العربية",
            value: _selectedLanguage == 'ar',
            onChanged: (value) => _changeLanguage('ar'),
            showDivider: false,
            titleFontFamily: FontFamilyUtils.getFontFamilyForLanguage('ar'),
            subtitleFontFamily: FontFamilyUtils.getFontFamilyForLanguage('ar'),
          ),

          SizedBox(
            height:
                MediaQuery.of(context).padding.bottom +
                context.responsiveMargin,
          ),
        ],
      ),
    );
  }
}
