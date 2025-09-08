import 'package:baqaltydeliveryapp/core/navigation_services/navigation_manager.dart';
import 'package:baqaltydeliveryapp/features/profile/presentation/view/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/bank_account.dart';
import '../../data/sample_bank_accounts.dart';
import '../widgets/amount_input_widget.dart';
import '../widgets/bank_account_card.dart';

class WithdrawalScreen extends StatefulWidget {
  final double availableBalance;

  const WithdrawalScreen({super.key, required this.availableBalance});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  double _withdrawalAmount = 0;
  BankAccount? _selectedBankAccount;
  List<BankAccount> _bankAccounts = [];

  @override
  void initState() {
    super.initState();
    _loadBankAccounts();
  }

  void _loadBankAccounts() {
    setState(() {
      _bankAccounts = SampleBankAccounts.getSampleBankAccounts();
      _selectedBankAccount = SampleBankAccounts.getDefaultAccount();
    });
  }

  void _onAmountChanged(double amount) {
    setState(() {
      _withdrawalAmount = amount;
    });
  }

  void _onBankAccountSelected(BankAccount account) {
    setState(() {
      _selectedBankAccount = account;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          // Header
          _buildHeader(context),
          Center(
            child: Text(
              'set_amount'.tr(),
              style: TextStyles.textViewBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(context.responsivePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Amount Input Section
                  _buildAmountSection(context),

                  SizedBox(height: context.responsiveMargin * 4),

                  // Bank Account Selection Section
                  _buildBankAccountSection(context),

                  SizedBox(height: context.responsiveMargin * 2),

                  // Add Bank Account Button
                  _buildAddBankAccountButton(context),

                  SizedBox(height: context.responsiveMargin * 4),
                ],
              ),
            ),
          ),

          // Bottom Button
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.responsiveMargin * 4,
        left: context.responsivePadding,
        right: context.responsivePadding,
        bottom: context.responsiveMargin * 2,
      ),
      child: Row(
        children: [
          CustomBackButton(icon: Icons.chevron_left, size: 40),

          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  Widget _buildAmountSection(BuildContext context) {
    return Column(
      children: [
        AmountInputWidget(
          amount: _withdrawalAmount,
          onAmountChanged: _onAmountChanged,
          maxAmount: widget.availableBalance,
          minAmount: 0,
        ),
      ],
    );
  }

  Widget _buildBankAccountSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'select_payout_method'.tr(),
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 4.5.w,
          ),
        ),

        SizedBox(height: context.responsiveMargin),

        Text(
          'bank_cards'.tr(),
          style: TextStyles.textViewBold16.copyWith(
            color: AppColors.textPrimary,
            fontSize: 3.5.w,
          ),
        ),

        SizedBox(height: context.responsiveMargin * 1.5),

        // Bank Account Cards
        ..._bankAccounts.map(
          (account) => BankAccountCard(
            bankAccount: account,
            isSelected: _selectedBankAccount?.id == account.id,
            onTap: () => _onBankAccountSelected(account),
          ),
        ),
      ],
    );
  }

  Widget _buildAddBankAccountButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        '+ ${'add_bank_account'.tr()}',
        style: TextStyles.textViewMedium14.copyWith(
          color: AppColors.primary,
          fontSize: 3.5.w,
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.responsivePadding,
        right: context.responsivePadding,
        top: context.responsiveMargin,
        bottom:
            context.responsiveMargin + MediaQuery.of(context).padding.bottom,
      ),
      child: PrimaryButton(
        text: 'confirm_withdrawal'.tr(),
        onPressed: () {
          NavigationManager.navigateTo(const PaymentSuccessScreen());
        },
        color: AppColors.primary,
        borderRadius: context.responsiveBorderRadius * 6,
        textStyle: TextStyles.textViewMedium16.copyWith(color: AppColors.white),
      ),
    );
  }
}
