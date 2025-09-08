import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'confirmation_dialog.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const LogoutConfirmationDialog({
    super.key,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: "logout".tr(),
      message: "logout_confirmation".tr(),
      confirmButtonText: "logout".tr(),
      onConfirm: onConfirm,
      onCancel: onCancel,
      icon: AppAssets.logoutIcon,
      iconColor: AppColors.error,
      confirmButtonColor: AppColors.error,
    );
  }
}
