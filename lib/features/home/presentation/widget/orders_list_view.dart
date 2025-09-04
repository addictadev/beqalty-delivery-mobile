import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/cubit/order_model.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/widget/order_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  // Sample data - in real app, this would come from API
  List<Order> get _sampleOrders => [
        const Order(
          id: '#BAQ10247',
          itemCount: 5,
          pickupLocation: 'KFC Maadi',
          pickupDistance: 0.8,
          deliveryLocation: 'Zahraa El Maadi',
          deliveryDistance: 2.3,
          earnings: 45,
          estimatedTime: 25,
        ),
        const Order(
          id: '#BAQ10248',
          itemCount: 3,
          pickupLocation: 'Pizza Hut Maadi',
          pickupDistance: 1.1,
          deliveryLocation: 'Nile Corniche',
          deliveryDistance: 2.7,
          earnings: 60,
          estimatedTime: 30,
        ),
        const Order(
          id: '#BAQ10249',
          itemCount: 4,
          pickupLocation: 'Subway Maadi',
          pickupDistance: 1.5,
          deliveryLocation: 'Maadi City Center',
          deliveryDistance: 3.0,
          earnings: 50,
          estimatedTime: 20,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        SizedBox(height: 2.h),
        _buildOrderList(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Available Orders',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${_sampleOrders.length} orders',
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

  Widget _buildOrderList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _sampleOrders.length,
      itemBuilder: (context, index) {
        final order = _sampleOrders[index];
        return OrderCard(
          order: order,
          onAccept: () => _showOrderAcceptedDialog(context, order),
          onReject: () => _showOrderRejectedDialog(context, order),
        );
      },
    );
  }

  void _showOrderAcceptedDialog(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Accepted!'),
        content: Text('You have successfully accepted order ${order.id}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showOrderRejectedDialog(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Rejected'),
        content: Text('You have rejected order ${order.id}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
