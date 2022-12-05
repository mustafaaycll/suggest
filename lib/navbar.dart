// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/screens/account/account.dart';
import 'package:suggest/screens/chat/chat.dart';
import 'package:suggest/screens/home/home.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/icons.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> _buildScreens() {
    return [Home(), Chat(), Account()];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.sabanci,
        inactiveColorPrimary: AppColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.chat),
        title: ("Chat"),
        activeColorPrimary: AppColors.sabanci,
        inactiveColorPrimary: AppColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(AppIcons.account),
        title: ("Account"),
        activeColorPrimary: AppColors.sabanci,
        inactiveColorPrimary: AppColors.systemGrey,
      ),
    ];
  }

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.bg,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
