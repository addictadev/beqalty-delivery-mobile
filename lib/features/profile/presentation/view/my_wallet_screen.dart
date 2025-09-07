import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../widgets/wallet_balance_card.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final double _balance = 5165.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileHeaderBackground,
      body: Column(
        children: [
          SizedBox(height: context.responsiveMargin * 4),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsivePadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(
                  icon: Icons.chevron_left,
                  size: 40,
                  color: Colors.grey.withValues(alpha: 0.2),
                  iconColor: AppColors.white,
                ),
                Text(
                  'my_wallet'.tr(),
                  style: TextStyles.textViewBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                CustomBackButton(
                  icon: Icons.support_agent,
                  size: 40,
                  color: Colors.grey.withValues(alpha: 0.2),
                  iconColor: AppColors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: context.responsiveMargin * 4),

          // Balance Card
          WalletBalanceCard(balance: _balance, currency: 'EGP'),

          SizedBox(height: context.responsiveMargin * 4),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.profileMenuBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.responsiveBorderRadius * 3),
                  topRight: Radius.circular(context.responsiveBorderRadius * 3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
