import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/utils/font_family_utils.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_textform_field.dart';
import 'package:baqaltydeliveryapp/features/auth/presentation/widgets/faq_card.dart';
import 'package:baqaltydeliveryapp/features/profile/data/datasources/faq_data_source.dart';
import 'package:baqaltydeliveryapp/features/profile/data/models/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  List<FAQModel> _faqs = [];
  List<FAQModel> _filteredFAQs = [];

  @override
  void initState() {
    super.initState();
    _loadFAQs();
  }

  void _loadFAQs() {
    setState(() {
      _faqs = FAQDataSource.getFAQs();
      _filteredFAQs = _faqs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),

          Padding(
            padding: EdgeInsets.only(
              left: context.responsivePadding,
              right: context.responsivePadding,
              top: context.responsivePadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(
                  icon: Icons.chevron_left,
                  size: 40,
                  color: Colors.grey.withValues(alpha: 0.2),
                  iconColor: AppColors.white,
                ),
              ],
            ),
          ),

          SizedBox(height: context.responsiveMargin * 2),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsivePadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "have_burning_question".tr(),
                  style: TextStyles.textViewBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: context.responsiveMargin * 2),
                CustomTextFormField(
                  hint: "search_faqs".tr(),
                  prefixIcon: Icon(
                    Iconsax.search_normal,
                    color: AppColors.textSecondary,
                  ),

                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
          SizedBox(height: context.responsiveMargin * 5),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.responsiveBorderRadius * 3),
                  topRight: Radius.circular(context.responsiveBorderRadius * 3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
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
                    padding: EdgeInsets.all(context.responsivePadding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "topics".tr(),
                          style: TextStyles.textViewBold18.copyWith(
                            color: AppColors.textPrimary,
                            fontFamily: FontFamilyUtils.getCurrentFontFamily(),
                          ),
                        ),
                        Text(
                          "view_all".tr(),
                          style: TextStyles.textViewMedium14.copyWith(
                            color: AppColors.primary,
                            fontFamily: FontFamilyUtils.getCurrentFontFamily(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.responsivePadding * 2,
                      ),
                      itemCount: _filteredFAQs.length,
                      itemBuilder: (context, index) {
                        final faq = _filteredFAQs[index];
                        return FAQCard(faq: faq, onViewTopic: () => {});
                      },
                    ),
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
