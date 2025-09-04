import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/features/replacements/data/order_item.dart';
import 'package:flutter/material.dart';

class ReplaceOrderItemCard extends StatefulWidget {
  final OrderItem item;
  final bool isSelected;
  final ValueChanged<bool> onSelectionChanged;

  const ReplaceOrderItemCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onSelectionChanged,
  });

  @override
  State<ReplaceOrderItemCard> createState() => _ReplaceOrderItemCardState();
}

class _ReplaceOrderItemCardState extends State<ReplaceOrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsiveMargin * 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onSelectionChanged(!widget.isSelected),
          borderRadius: BorderRadius.circular(context.responsiveBorderRadius),
          child: Padding(
            padding: EdgeInsets.all(context.responsivePadding),
            child: Row(
              children: [
                // Product Image
                _buildProductImage(context),

                SizedBox(width: context.responsiveMargin),

                // Product Details
                Expanded(child: _buildProductDetails(context)),

                SizedBox(width: context.responsiveMargin),

                // Checkbox
                _buildCheckbox(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Container(
      width: context.responsiveIconSize * 2.5,
      height: context.responsiveIconSize * 2.5,
      decoration: BoxDecoration(
        color: AppColors.borderLight,
        borderRadius: BorderRadius.circular(
          context.responsiveBorderRadius * 0.5,
        ),
        image: DecorationImage(
          image: AssetImage(widget.item.imageUrl),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            // Fallback to placeholder if image fails to load
          },
        ),
      ),
      child: widget.item.imageUrl.contains('assets/images/chocolate_milk.png')
          ? _buildPlaceholderImage(context)
          : null,
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(
          context.responsiveBorderRadius * 0.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_drink,
              size: context.responsiveIconSize,
              color: AppColors.textLight,
            ),
            SizedBox(height: context.responsiveMargin * 0.5),
            Text(
              'Coffee\nShake',
              textAlign: TextAlign.center,
              style: TextStyles.textViewMedium10.copyWith(
                color: AppColors.textSecondary,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Product Name
        Text(
          widget.item.name,
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: context.responsiveMargin * 0.5),

        // Quantity
        Text(
          '${widget.item.quantity} Items',
          style: TextStyles.textViewRegular14.copyWith(
            color: AppColors.textSecondary,
          ),
        ),

        SizedBox(height: context.responsiveMargin * 0.5),

        // Price
        Text(
          '${widget.item.price.toStringAsFixed(2)} ${widget.item.currency}',
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(BuildContext context) {
    return Container(
      width: context.responsiveIconSize * 1.2,
      height: context.responsiveIconSize * 1.2,
      decoration: BoxDecoration(
        color: widget.isSelected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(
          context.responsiveBorderRadius * 0.3,
        ),
        border: Border.all(
          color: widget.isSelected ? AppColors.primary : AppColors.borderLight,
          width: 2,
        ),
      ),
      child: widget.isSelected
          ? Icon(
              Icons.check,
              size: context.responsiveIconSize * 0.8,
              color: AppColors.white,
            )
          : null,
    );
  }
}
