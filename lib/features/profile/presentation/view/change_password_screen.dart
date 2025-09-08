import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/custom_textform_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final bool _isLoading = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.responsivePadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: context.responsiveMargin * 4),

                    _buildHeader(context),

                    SizedBox(height: context.responsiveMargin * 6),

                    _buildPasswordFields(context),

                    SizedBox(height: context.responsiveMargin * 6),
                  ],
                ),
              ),
            ),
          ),

          _buildSaveButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(icon: Icons.chevron_left, size: 40),
        Text(
          "password".tr(),
          style: TextStyles.textViewMedium18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  Widget _buildPasswordFields(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: "old_password".tr(),
          hint: "enter_old_password".tr(),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),

        SizedBox(height: context.responsiveMargin * 2),
        CustomTextFormField(
          label: "new_password".tr(),
          hint: "enter_new_password".tr(),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),

        SizedBox(height: context.responsiveMargin * 2),

        CustomTextFormField(
          label: "retype_new_password".tr(),
          hint: "retype_new_password_placeholder".tr(),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.responsivePadding,
        right: context.responsivePadding,
        bottom:
            context.responsiveMargin * 4 +
            MediaQuery.of(context).padding.bottom,
      ),
      child: PrimaryButton(
        text: "save".tr(),
        onPressed: () {},
        isLoading: _isLoading,
        borderRadius: context.responsiveBorderRadius * 6,
        color: AppColors.overlayGray3,
        textStyle: TextStyles.textViewMedium16.copyWith(
          color: AppColors.primary,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
