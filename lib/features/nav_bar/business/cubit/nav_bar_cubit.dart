import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/images_preview/app_assets.dart';
import '../models/nav_item_model.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial()) {
    _initializeNavigation();
  }

  void _initializeNavigation() {
    final navItems = [
      NavItemModel(
        index: 0,
        icon: AppAssets.homeIcon,
        activeIcon: AppAssets.homeIcon,
        label: 'home',
        isActive: true,
      ),
      NavItemModel(
        index: 1,
        icon: AppAssets.earningIcon,
        activeIcon: AppAssets.earningIcon,
        label: 'earnings',
        isActive: false,
      ),
      NavItemModel(
        index: 2,
        icon: AppAssets.historyIcon,
        activeIcon: AppAssets.historyIcon,
        label: 'history',
        isActive: false,
      ),
      NavItemModel(
        index: 3,
        icon: AppAssets.alertIcon,
        activeIcon: AppAssets.alertIcon,
        label: 'alerts',
        isActive: false,
      ),
      NavItemModel(
        index: 4,
        icon: AppAssets.profileIcon,
        activeIcon: AppAssets.profileIcon,
        label: 'profile',
        isActive: false,
      ),
    ];

    emit(NavBarLoaded(navItems: navItems, currentIndex: 0));
  }

  void changeTab(int index) {
    final currentState = state;
    if (currentState is NavBarLoaded) {
      final updatedNavItems = currentState.navItems.map((item) {
        return item.copyWith(isActive: item.index == index);
      }).toList();

      emit(NavBarLoaded(navItems: updatedNavItems, currentIndex: index));
    }
  }

  int getCurrentIndex() {
    final currentState = state;
    if (currentState is NavBarLoaded) {
      return currentState.currentIndex;
    }
    return 0;
  }

  List<NavItemModel> getNavItems() {
    final currentState = state;
    if (currentState is NavBarLoaded) {
      return currentState.navItems;
    }
    return [];
  }
}
