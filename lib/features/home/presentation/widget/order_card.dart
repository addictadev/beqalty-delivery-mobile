import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/cubit/order_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const OrderCard({
    super.key,
    required this.order,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 2.5.h),
            _buildLocationSection(context),
            SizedBox(height: 2.5.h),
            _buildEarningsAndTimeSection(context),
            SizedBox(height: 2.5.h),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          order.id,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: -0.3,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.8.h),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${order.itemCount} items',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection(BuildContext context) {
    return Column(
      children: [
        _buildLocationRow(
          context,
          icon: Iconsax.shop5,
          location: order.pickupLocation,
          distance: order.pickupDistance,
          isPickup: true,
        ),
        SizedBox(height: 2.h),
        _buildLocationRow(
          context,
          icon: Iconsax.location5,
          location: order.deliveryLocation,
          distance: order.deliveryDistance,
          isPickup: false,
        ),
      ],
    );
  }

  Widget _buildLocationRow(
    BuildContext context, {
    required IconData icon,
    required String location,
    required double distance,
    required bool isPickup,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 9.w,
          height: 9.w,

          child: Icon(
            icon,
            size: 4.5.w,
            color: isPickup ? AppColors.primary : AppColors.error,
          ),
        ),
        SizedBox(width: 3.5.w),
        Expanded(
          child: Row(
            children: [
              Text(
                location,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: 1.w),
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 1.w),
              Text(
                '${distance.toStringAsFixed(1)} km',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEarningsAndTimeSection(BuildContext context) {
    return Row(
      children: [
        _buildEarningsSection(context),
        SizedBox(width: 5.w),
        _buildTimeSection(context),
      ],
    );
  }

  Widget _buildEarningsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EGP ${order.earnings.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.orderEarningsGreen,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          'Earnings',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSection(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${order.estimatedTime} min',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        SizedBox(height: 0.5.h),
        Text(
          'Est. Time',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context,
            text: 'Reject',
            onPressed: onReject,
            isReject: true,
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: _buildActionButton(
            context,
            text: 'Accept',
            onPressed: onAccept,
            isReject: false,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String text,
    required VoidCallback? onPressed,
    required bool isReject,
  }) {
    return Container(
      height: 5.h,
      decoration: BoxDecoration(
        color: isReject ? AppColors.white : AppColors.primary,
        borderRadius: BorderRadius.circular(22),
        border: isReject
            ? Border.all(color: AppColors.borderLight, width: 1.0)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isReject ? AppColors.textSecondary : AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
