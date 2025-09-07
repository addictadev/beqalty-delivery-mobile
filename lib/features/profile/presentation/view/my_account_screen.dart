import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/custom_textform_field.dart';
import '../widgets/profile_avatar_widget.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.responsivePadding),
              child: Column(
                children: [
                  SizedBox(height: context.responsiveMargin * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(icon: Icons.chevron_left, size: 40),
                      Text(
                        'my_account'.tr(),
                        style: TextStyles.textViewBold18.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                  SizedBox(height: context.responsiveMargin * 4),

                  Center(
                    child: Stack(
                      children: [
                        ProfileAvatarWidget(
                          size: 25.w,
                          showBorder: true,
                          borderColor: AppColors.white,
                          borderWidth: 4,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            child: Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadowLight,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColors.white,
                                size: 4.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: context.responsiveMargin * 6),

                  CustomTextFormField(
                    label: "name".tr(),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: context.responsiveMargin * 2),

                  CustomTextFormField(
                    label: "phone_number".tr(),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: context.responsiveMargin * 6),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: context.responsivePadding,
              right: context.responsivePadding,
              bottom:
                  context.responsiveMargin * 4 +
                  MediaQuery.of(context).padding.bottom,
            ),
            child: PrimaryButton(
              text: 'save'.tr(),

              borderRadius: context.responsiveBorderRadius * 6,
              color: AppColors.overlayGray3,
              textStyle: TextStyles.textViewMedium16.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
