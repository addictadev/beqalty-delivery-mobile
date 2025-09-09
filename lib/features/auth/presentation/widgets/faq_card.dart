import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/utils/font_family_utils.dart';
import 'package:baqaltydeliveryapp/core/widgets/primary_button.dart';
import 'package:baqaltydeliveryapp/features/profile/data/models/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

class FAQCard extends StatelessWidget {
  final FAQModel faq;
  final VoidCallback? onViewTopic;

  const FAQCard({super.key, required this.faq, this.onViewTopic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsiveMargin * 2),
      decoration: BoxDecoration(
        color: AppColors.overlayGray,
        borderRadius: BorderRadius.circular(context.responsiveBorderRadius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.responsivePadding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              faq.question.tr(),
              style: TextStyles.textViewBold16.copyWith(
                color: AppColors.textPrimary,
                fontFamily: FontFamilyUtils.getCurrentFontFamily(),
              ),
            ),

            SizedBox(height: context.responsiveMargin),

            Text(
              faq.answer.tr(),
              style: TextStyles.textViewRegular14.copyWith(
                color: AppColors.textPrimary,
                fontFamily: FontFamilyUtils.getCurrentFontFamily(),
                height: 1.4,
              ),
            ),

            SizedBox(height: context.responsiveMargin * 1.5),

            SizedBox(
              width: 33.w,
              child: PrimaryButton(
                text: "view_topic".tr(),
                onPressed: onViewTopic,
                color: AppColors.overlayGray3,
                height: 5.h,
                fontSize: 3.5.w,
                borderRadius: context.responsiveBorderRadius,
                textStyle: TextStyles.textViewMedium14.copyWith(
                  color: AppColors.textPrimary,
                  fontFamily: FontFamilyUtils.getCurrentFontFamily(),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
