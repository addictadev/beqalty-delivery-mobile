import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_textform_field.dart';
import 'package:baqaltydeliveryapp/features/history/data/history_entry.dart';
import 'package:baqaltydeliveryapp/features/history/data/sample_history.dart';
import 'package:baqaltydeliveryapp/features/history/presentation/widget/history_section.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<HistoryEntry> _filteredHistory = [];
  List<HistoryEntry> _allHistory = [];

  @override
  void initState() {
    super.initState();
    _allHistory = SampleHistory.getSampleHistory();
    _filteredHistory = _allHistory;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    setState(() {
      if (query.isEmpty) {
        _filteredHistory = _allHistory;
      } else {
        _filteredHistory = SampleHistory.searchHistory(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.responsiveMargin * 6),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.responsivePadding,
            vertical: context.responsiveMargin,
          ),
          child: Row(
            children: [
              // Back Button
              Container(
                width: context.responsiveIconSize * 1.5,
                height: context.responsiveIconSize * 1.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_left,
                    color: AppColors.textPrimary,
                    size: context.responsiveIconSize,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),

              // Title
              Expanded(
                child: Center(
                  child: Text(
                    "history".tr(),
                    style: TextStyles.textViewBold18.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: Container(
                  width: context.responsiveIconSize * 1.5,
                  height: context.responsiveIconSize * 1.5,
                  padding: EdgeInsets.all(context.responsivePadding * 0.5),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Iconsax.filter5,
                    color: AppColors.textPrimary,
                    size: context.responsiveIconSize,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.responsiveMargin),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsivePadding),
          child: CustomTextFormField(
            hint: "search_history".tr(),
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: AppColors.textSecondary,
            ),
            onChanged: (value) {
              debugPrint(value);
            },
          ),
        ),
        SizedBox(height: context.responsiveMargin * 2),

        Expanded(child: _buildContent(context)),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_filteredHistory.isEmpty) {
      return _buildEmptyState(context);
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.responsivePadding),
      child: Column(
        children: [
          // Today's History
          HistorySection(
            title: 'today',
            historyEntries: _filteredHistory.where((e) => e.isToday).toList(),
            onCardTap: _onHistoryCardTap,
          ),

          // Yesterday's History
          HistorySection(
            title: 'yesterday',
            historyEntries: _filteredHistory
                .where((e) => e.isYesterday)
                .toList(),
            onCardTap: _onHistoryCardTap,
          ),

          // Older History (if any)
          if (_filteredHistory.any((e) => !e.isToday && !e.isYesterday))
            HistorySection(
              title: 'older',
              historyEntries: _filteredHistory
                  .where((e) => !e.isToday && !e.isYesterday)
                  .toList(),
              onCardTap: _onHistoryCardTap,
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: context.responsiveIconSize * 3,
            color: AppColors.textLight,
          ),
          SizedBox(height: context.responsiveMargin * 2),
          Text(
            "no_history_found".tr(),
            style: TextStyles.textViewMedium18.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.responsiveMargin),
          Text(
            "start_delivering_message".tr(),
            style: TextStyles.textViewRegular14.copyWith(
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _onHistoryCardTap(HistoryEntry entry) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${entry.orderId} - ${entry.status}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
