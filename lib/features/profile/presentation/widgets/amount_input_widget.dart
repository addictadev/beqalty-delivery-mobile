import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/styles/styles.dart';

class AmountInputWidget extends StatelessWidget {
  final double amount;
  final ValueChanged<double> onAmountChanged;
  final double? maxAmount;
  final double? minAmount;

  const AmountInputWidget({
    super.key,
    required this.amount,
    required this.onAmountChanged,
    this.maxAmount,
    this.minAmount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAmountButton(
            context,
            icon: Icons.remove,
            onPressed: _canDecrease() ? () => _decreaseAmount() : null,
            isEnabled: _canDecrease(),
          ),

          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    amount.toStringAsFixed(0),
                    style: TextStyles.textViewBold24.copyWith(
                      color: AppColors.primary,
                      fontSize: 14.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Container(
                    width: 60.w,
                    height: 1,
                    color: AppColors.borderLight,
                  ),
                ],
              ),
            ),
          ),

          _buildAmountButton(
            context,
            icon: Icons.add,
            onPressed: _canIncrease() ? () => _increaseAmount() : null,
            isEnabled: _canIncrease(),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountButton(
    BuildContext context, {
    required IconData icon,
    VoidCallback? onPressed,
    required bool isEnabled,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 12.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: isEnabled
              ? (icon == Icons.add ? AppColors.primary : Colors.transparent)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderDark, width: 1),
        ),
        child: Icon(
          icon,
          color: isEnabled
              ? (icon == Icons.add ? Colors.white : AppColors.textTertiary)
              : AppColors.textTertiary,
          size: 6.w,
        ),
      ),
    );
  }

  bool _canDecrease() {
    return minAmount != null && amount > minAmount!;
  }

  bool _canIncrease() {
    return maxAmount != null && amount < maxAmount!;
  }

  void _decreaseAmount() {
    if (_canDecrease()) {
      onAmountChanged(amount - 1);
    }
  }

  void _increaseAmount() {
    if (_canIncrease()) {
      onAmountChanged(amount + 1);
    }
  }
}
