import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/widget/home_header.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/widget/current_order_widget.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/widget/order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          const HomeHeader(),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 2.h),

                    CurrentOrderWidget(
                      onContactPressed: () {},
                      onNavigatePressed: () {},
                      onDeliveredPressed: () {},
                    ),
                    SizedBox(height: 3.h),

                    // Available Orders List
                    const OrdersListView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
