import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/utils/shared_prefs_helper.dart';
import '../widgets/notification_setting_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Notification settings keys
  static const String _transactionAlertKey = 'transaction_alert_enabled';
  static const String _insightAlertKey = 'insight_alert_enabled';
  static const String _sortTransactionsAlertKey =
      'sort_transactions_alert_enabled';

  // Default values
  bool _transactionAlert = true;
  bool _insightAlert = false;
  bool _sortTransactionsAlert = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationSettings();
  }

  void _loadNotificationSettings() {
    setState(() {
      _transactionAlert = SharedPrefsHelper.getBool(
        _transactionAlertKey,
        defaultValue: true,
      );
      _insightAlert = SharedPrefsHelper.getBool(
        _insightAlertKey,
        defaultValue: false,
      );
      _sortTransactionsAlert = SharedPrefsHelper.getBool(
        _sortTransactionsAlertKey,
        defaultValue: false,
      );
    });
  }

  void _saveNotificationSetting(String key, bool value) {
    SharedPrefsHelper.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.responsivePadding),
          child: Column(
            children: [
              SizedBox(height: context.responsiveMargin),

              // Header with back button and title
              _buildHeader(context),

              SizedBox(height: context.responsiveMargin * 6),

              // Notification settings
              Expanded(child: _buildNotificationSettings(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(icon: Icons.chevron_left, size: 40),
        Text(
          "notifications".tr(),
          style: TextStyles.textViewMedium18.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  Widget _buildNotificationSettings(BuildContext context) {
    return Column(
      children: [
        // Transaction Alert
        NotificationSettingItem(
          title: "transaction_alert".tr(),
          value: _transactionAlert,
          onChanged: (value) {
            setState(() {
              _transactionAlert = value;
            });
            _saveNotificationSetting(_transactionAlertKey, value);
          },
        ),

        // Insight Alert
        NotificationSettingItem(
          title: "insight_alert".tr(),
          value: _insightAlert,
          onChanged: (value) {
            setState(() {
              _insightAlert = value;
            });
            _saveNotificationSetting(_insightAlertKey, value);
          },
        ),

        // Sort Transactions Alert
        NotificationSettingItem(
          title: "sort_transactions_alert".tr(),
          value: _sortTransactionsAlert,
          onChanged: (value) {
            setState(() {
              _sortTransactionsAlert = value;
            });
            _saveNotificationSetting(_sortTransactionsAlertKey, value);
          },
          showDivider: false, // Last item, no divider
        ),
      ],
    );
  }
}
