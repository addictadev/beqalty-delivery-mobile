import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/utils/styles/styles.dart';
import 'package:baqaltydeliveryapp/core/widgets/exit_popup.dart';
import 'package:baqaltydeliveryapp/features/home/presentation/view/home_screen.dart';
import 'package:baqaltydeliveryapp/features/nav_bar/business/cubit/nav_bar_cubit.dart';
import 'package:baqaltydeliveryapp/features/nav_bar/business/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../core/images_preview/custom_svg_img.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: const MainNavigationScreenBody(),
    );
  }
}

class MainNavigationScreenBody extends StatelessWidget {
  const MainNavigationScreenBody({super.key});

  static final List<Widget> _screens = [
    HomeView(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        if (state is NavBarLoaded) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              if (didPop) return;
              final shouldPop = await showDialog<bool>(
                context: context,
                builder: (_) => const ExitPopUp(),
              );
              if (shouldPop == true && context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              body: _screens[state.currentIndex],
              bottomNavigationBar: _buildBottomNavigationBar(context, state),
            ),
          );
        }

        return const Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, NavBarLoaded state) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: context.responsiveMargin * 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.scaffoldBackground,
                      AppColors.scaffoldBackground.withValues(alpha: 0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      context.responsiveBorderRadius * 2,
                    ),
                    topRight: Radius.circular(
                      context.responsiveBorderRadius * 2,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsivePadding,
                vertical: context.responsiveMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: state.navItems.map((navItem) {
                  return _buildNavItem(context, navItem);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, NavItemModel navItem) {
    return AnimatedNavItem(
      navItem: navItem,
      onTap: () {
        context.read<NavBarCubit>().changeTab(navItem.index);
      },
    );
  }
}

class AnimatedNavItem extends StatefulWidget {
  final NavItemModel navItem;
  final VoidCallback onTap;

  const AnimatedNavItem({
    super.key,
    required this.navItem,
    required this.onTap,
  });

  @override
  State<AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<AnimatedNavItem>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _rippleController;
  late AnimationController _slideController;
  late AnimationController _colorController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _rippleAnimation;
  late Animation<Color?> _colorAnimation;

  late Animation<double> _iconScaleAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _colorController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _colorAnimation =
        ColorTween(
          begin: AppColors.textSecondary,
          end: AppColors.primary,
        ).animate(
          CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
        );

    _iconScaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.elasticOut),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );

    if (widget.navItem.isActive) {
      _startActiveAnimations();
    }
  }

  void _startActiveAnimations() {
    _slideController.forward();
    _colorController.forward();
  }

  void _stopActiveAnimations() {
    _slideController.reverse();
    _colorController.reverse();
  }

  @override
  void didUpdateWidget(AnimatedNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.navItem.isActive != oldWidget.navItem.isActive) {
      if (widget.navItem.isActive) {
        _startActiveAnimations();
      } else {
        _stopActiveAnimations();
      }
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rippleController.dispose();
    _slideController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _scaleController.forward().then((_) {
      _scaleController.reverse();
    });

    _rippleController.forward().then((_) {
      _rippleController.reset();
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _scaleController,
          _rippleController,
          _slideController,
          _colorController,
        ]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsiveMargin * 1.5,
                vertical: context.responsiveMargin * 0.5,
              ),
              decoration: BoxDecoration(
                color: widget.navItem.isActive
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  context.responsiveBorderRadius,
                ),
              ),
              child: Stack(
                children: [
                  if (_rippleAnimation.value > 0)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withValues(
                            alpha: (1 - _rippleAnimation.value) * 0.3,
                          ),
                        ),
                      ),
                    ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ScaleTransition(
                        scale: _iconScaleAnimation,
                        child: CustomSvgImage(
                          assetName: widget.navItem.isActive
                              ? widget.navItem.activeIcon
                              : widget.navItem.icon,
                          color: widget.navItem.isActive
                              ? _colorAnimation.value ?? AppColors.primary
                              : AppColors.textSecondary,
                          width: context.responsiveIconSize,
                        ),
                      ),

                      SizedBox(height: context.responsiveMargin * 0.3),

                      FadeTransition(
                        opacity: _textOpacityAnimation,
                        child: Text(
                          widget.navItem.label.tr(),
                          style:
                              (widget.navItem.isActive
                                      ? TextStyles.textViewMedium12
                                      : TextStyles.textViewRegular12)
                                  .copyWith(
                                    color: widget.navItem.isActive
                                        ? _colorAnimation.value ??
                                              AppColors.primary
                                        : _colorAnimation.value ??
                                              AppColors.textSecondary,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
