import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'confirmation_dialog.dart';

class DeleteAccountConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const DeleteAccountConfirmationDialog({
    super.key,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: "delete_account".tr(),
      message: "delete_account_confirmation".tr(),
      confirmButtonText: "delete_account".tr(),
      onConfirm: onConfirm,
      onCancel: onCancel,
      icon: AppAssets.deleteAccountIcon,
      iconColor: AppColors.error,
      confirmButtonColor: AppColors.error,
    );
  }
}
