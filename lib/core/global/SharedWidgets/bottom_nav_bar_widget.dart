import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Features/Azkari/Presentation/views/azkari_view.dart';
import '../../../Features/Dalelk/Presentation/views/dalelk_view.dart';
import '../../../Features/Home/Presentation/views/home_view.dart';
import '../../../Features/Sebha/Presentation/views/sebha_view.dart';
import '../../../Features/Settings/Presentation/views/setting_view.dart';
import '../localization/generated/l10n.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final _bottomNavBarController = PersistentTabController();
  // @override
  // void dispose() {
  //   _bottomNavBarController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,

        controller: _bottomNavBarController,

        screens: _buildScreens(),

        items: _navBarsItems(context),

        resizeToAvoidBottomInset: true,

        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,

        bottomScreenMargin: 0,

        // onWillPop: (final context) async {
        //   await showDialog(
        //     context: context!,
        //     useSafeArea: true,
        //     builder: (final context) => Container(
        //       height: 50,
        //       width: 50,
        //       color: Colors.white,
        //       child: ElevatedButton(
        //         child: const Text("Close"),
        //         onPressed: () {
        //           // Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //   );

        //   return false;
        // },

        selectedTabScreenContext: (final context) {},
        handleAndroidBackButtonPress: true,
        backgroundColor: Colors.black,

        // hideNavigationBar: _hideNavBar,

        decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),

        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),

        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),

        // navBarStyle:

        //     NavBarStyle.style19, // Choose the nav bar style with this property
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const AzkariView(),
    const SebhaView(),
    const DalelkView(),
    const SettingView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems(context) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: (S.of(context).navBar1),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.bag),
      title: (S.of(context).navBar2),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.shopping_cart), //! Change cupertino icons

      title: (S.of(context).navBar3),

      activeColorPrimary: CupertinoColors.activeBlue,

      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite_border),
      title: (S.of(context).navBar4),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.settings),
      title: (S.of(context).navBar5),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
