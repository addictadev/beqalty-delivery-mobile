import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/app_colors.dart';

class CustomToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double? width;
  final double? height;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double? borderRadius;

  const CustomToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width,
    this.height,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final toggleWidth = width ?? 12.w;
    final toggleHeight = height ?? 6.w;
    final thumbSize = toggleHeight * 0.8;
    final thumbPadding = (toggleHeight - thumbSize) / 2;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: toggleWidth,
        height: toggleHeight,
        decoration: BoxDecoration(
          color: value
              ? (activeColor ?? AppColors.primary)
              : (inactiveColor ?? AppColors.borderLight),
          borderRadius: BorderRadius.circular(borderRadius ?? toggleHeight / 2),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            margin: EdgeInsets.all(thumbPadding),
            decoration: BoxDecoration(
              color: thumbColor ?? AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
