import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeHeader extends StatelessWidget {
  final String? searchHint;

  const HomeHeader({super.key, this.searchHint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(context.responsiveBorderRadius * 4),
          bottomRight: Radius.circular(context.responsiveBorderRadius * 4),
        ),
        color: AppColors.primary,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsivePadding,
            vertical: context.responsivePadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGreetingSection(),

                  SizedBox(width: context.responsiveMargin),
                ],
              ),
              SizedBox(height: context.responsiveContainerHeight / 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HI Ahmed,",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            height: 1.2,
          ),
        ),
        Text(
          "Ready to Deliver?",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
