import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/widgets/primary_button.dart';
import 'package:baqaltydeliveryapp/features/replacements/data/order_item.dart';
import 'package:baqaltydeliveryapp/features/replacements/data/sample_order_items.dart';
import 'package:baqaltydeliveryapp/features/replacements/presentation/widget/replace_order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ReplaceItemsScreen extends StatefulWidget {
  const ReplaceItemsScreen({super.key});

  @override
  State<ReplaceItemsScreen> createState() => _ReplaceItemsScreenState();
}

class _ReplaceItemsScreenState extends State<ReplaceItemsScreen> {
  final List<OrderItem> _orderItems = [];
  final Set<String> _selectedItems = {};

  @override
  void initState() {
    super.initState();
    _orderItems.addAll(SampleOrderItems.getSampleOrderItems());
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

              Expanded(
                child: Center(
                  child: Text(
                    "replace_items".tr(),
                    style: TextStyles.textViewBold18.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),

              SizedBox(width: context.responsiveIconSize * 1.5),
            ],
          ),
        ),
        SizedBox(height: context.responsiveMargin),

        Expanded(child: _buildContent(context)),

        _buildBottomButton(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(context.responsivePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context),

          SizedBox(height: context.responsiveMargin * 2),

          _buildOrderItemsList(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Text(
      "order_items".tr(),
      style: TextStyles.textViewMedium14.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildOrderItemsList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _orderItems.length,
      itemBuilder: (context, index) {
        final item = _orderItems[index];
        final isSelected = _selectedItems.contains(item.id);

        return ReplaceOrderItemCard(
          item: item,
          isSelected: isSelected,
          onSelectionChanged: (selected) {
            setState(() {
              if (selected) {
                _selectedItems.add(item.id);
              } else {
                _selectedItems.remove(item.id);
              }
            });
          },
        );
      },
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return _buildActionButton(context);
  }

  Widget _buildActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PrimaryButton(onPressed: () {}, text: "ask_to_replace".tr()),
    );
  }
}
