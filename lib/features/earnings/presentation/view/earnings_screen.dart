import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_textform_field.dart';
import 'package:baqaltydeliveryapp/features/earnings/data/sample_earnings.dart';
import 'package:baqaltydeliveryapp/features/earnings/presentation/widget/earnings_section.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allEarnings = SampleEarnings.getSampleEarnings();

    return Column(
      children: [
        SizedBox(height: context.responsiveMargin * 6),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsivePadding,
            vertical: context.responsiveMargin,
          ),
          child: Row(
            children: [
              // Back Button
              Container(
                width: context.responsiveIconSize * 1.5,
                height: context.responsiveIconSize * 1.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_left,
                    color: AppColors.textPrimary,
                    size: context.responsiveIconSize,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),

              // Title
              Expanded(
                child: Center(
                  child: Text(
                    "earnings".tr(),
                    style: TextStyles.textViewBold18.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: Container(
                  width: context.responsiveIconSize * 1.5,
                  height: context.responsiveIconSize * 1.5,
                  padding: EdgeInsets.all(context.responsivePadding * 0.5),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Iconsax.filter5,
                    color: AppColors.textPrimary,
                    size: context.responsiveIconSize,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.responsiveMargin),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsivePadding),
          child: CustomTextFormField(
            hint: "search_earnings".tr(),
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: AppColors.textSecondary,
            ),
            onChanged: (value) {
              debugPrint(value);
            },
          ),
        ),
        SizedBox(height: context.responsiveMargin * 2),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                // Today's Earnings
                EarningsSection(
                  title: 'today'.tr(),
                  earnings: allEarnings.where((e) => e.isToday).toList(),
                  onCardTap: (earning) => {},
                ),

                // Yesterday's Earnings
                EarningsSection(
                  title: 'yesterday'.tr(),
                  earnings: allEarnings.where((e) => e.isYesterday).toList(),
                  onCardTap: (earning) => {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
