import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../core/utils/utils.dart';
import '../../../cart/presentation/views/cart_view.dart';

class HomeNavBar extends StatelessWidget {
  HomeNavBar({Key? key}) : super(key: key);
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
      backgroundColor: AppColors.primaryColor, // Default is Colors.white.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [const HomeView(), const CartView(), const SearchView(), const ProfileView()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(AppAssets.imagesHomeIconActive),
      inactiveIcon: SvgPicture.asset(AppAssets.imagesHomeIcon),
      title: ("Home"),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(AppAssets.imagesShoppingCartActive),
      inactiveIcon: SvgPicture.asset(AppAssets.imagesShoppingCart),
      title: ("Cart"),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(AppAssets.imagesSearchActive),
      inactiveIcon: SvgPicture.asset(AppAssets.imagesSearch),
      title: ("Search"),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(AppAssets.imagesPersonActive),
      inactiveIcon: SvgPicture.asset(AppAssets.imagesPerson),
      title: ("Profile"),
    ),
  ];
}
