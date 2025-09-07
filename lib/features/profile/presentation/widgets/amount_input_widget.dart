import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
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
      padding: EdgeInsets.all(context.responsivePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Decrease button
          _buildAmountButton(
            context,
            icon: Icons.remove,
            onPressed: _canDecrease() ? () => _decreaseAmount() : null,
          ),

          // Amount display
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text(
                    amount.toStringAsFixed(0),
                    style: TextStyles.textViewBold24.copyWith(
                      color: AppColors.primary,
                      fontSize: 12.w,
                    ),
                  ),
                  Container(
                    width: 20.w,
                    height: 2,
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                ],
              ),
            ),
          ),

          // Increase button
          _buildAmountButton(
            context,
            icon: Icons.add,
            onPressed: _canIncrease() ? () => _increaseAmount() : null,
          ),
        ],
      ),
    );
  }

  Widget _buildAmountButton(
    BuildContext context, {
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 12.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: onPressed != null ? AppColors.white : AppColors.borderLight,
          shape: BoxShape.circle,
          border: Border.all(
            color: onPressed != null
                ? AppColors.borderLight
                : AppColors.borderLight,
            width: 1,
          ),
          boxShadow: onPressed != null
              ? [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          color: onPressed != null
              ? AppColors.textPrimary
              : AppColors.textLight,
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
