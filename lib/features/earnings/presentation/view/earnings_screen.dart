import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_appbar.dart';
import 'package:baqaltydeliveryapp/features/earnings/data/sample_earnings.dart';
import 'package:baqaltydeliveryapp/features/earnings/domain/models/earning_entry.dart';
import 'package:baqaltydeliveryapp/features/earnings/presentation/widget/earnings_search_bar.dart';
import 'package:baqaltydeliveryapp/features/earnings/presentation/widget/earnings_section.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<EarningEntry> _filteredEarnings = [];
  List<EarningEntry> _allEarnings = [];

  @override
  void initState() {
    super.initState();
    _loadEarnings();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEarnings() {
    _allEarnings = SampleEarnings.getSampleEarnings();
    _filteredEarnings = List.from(_allEarnings);
  }

  void _filterEarnings(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredEarnings = List.from(_allEarnings);
      });
    } else {
      setState(() {
        _filteredEarnings = _allEarnings
            .where((earning) =>
                earning.orderId.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  List<EarningEntry> _getEarningsByDate(String dateLabel) {
    return _filteredEarnings
        .where((earning) => earning.dateLabel == dateLabel)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: 'Earnings',
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement filter functionality
              _showFilterOptions();
            },
            icon: Icon(
              Iconsax.filter,
              color: AppColors.textPrimary,
              size: 6.w,
            ),
          ),
          SizedBox(width: 2.w),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(4.w),
            child: EarningsSearchBar(
              controller: _searchController,
              onChanged: _filterEarnings,
            ),
          ),
          
          // Divider
          Container(
            height: 1,
            color: AppColors.borderLight,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
          ),
          
          // Earnings List
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  // Today's Earnings
                  EarningsSection(
                    title: 'Today',
                    earnings: _getEarningsByDate('Today'),
                    onCardTap: (earning) => _onEarningCardTap(earning),
                  ),
                  
                  // Yesterday's Earnings
                  EarningsSection(
                    title: 'Yesterday',
                    earnings: _getEarningsByDate('Yesterday'),
                    onCardTap: (earning) => _onEarningCardTap(earning),
                  ),
                  
                  // Add more sections for other dates if needed
                  if (_filteredEarnings.any((e) => 
                      !e.isToday && !e.isYesterday))
                    ..._getOtherDateSections(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getOtherDateSections() {
    final otherDates = _filteredEarnings
        .where((e) => !e.isToday && !e.isYesterday)
        .map((e) => e.dateLabel)
        .toSet()
        .toList();
    
    return otherDates.map((dateLabel) => EarningsSection(
      title: dateLabel,
      earnings: _getEarningsByDate(dateLabel),
      onCardTap: (earning) => _onEarningCardTap(earning),
    )).toList();
  }

  void _onEarningCardTap(EarningEntry earning) {
    // TODO: Navigate to order details or show earning details
    _showEarningDetails(earning);
  }

  void _showEarningDetails(EarningEntry earning) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Earning Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${earning.orderId}'),
            SizedBox(height: 1.h),
            Text('Time: ${earning.time}'),
            SizedBox(height: 1.h),
            Text('Amount: +${earning.amount.toStringAsFixed(0)} EGP'),
            SizedBox(height: 1.h),
            Text('Date: ${earning.dateLabel}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: AppColors.borderLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'Filter Earnings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 3.h),
            // TODO: Add filter options
            Text(
              'Filter options coming soon...',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
