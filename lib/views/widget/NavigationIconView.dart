import 'package:flutter/material.dart';


class NavigationIconView {
  final BottomNavigationBarItem item;
  final AnimationController controller;

  NavigationIconView({
    Widget icon,
    Widget title,
    Widget activeIcon,
    TickerProvider vsync
  })
      :
       item = new BottomNavigationBarItem(icon: icon, activeIcon: activeIcon, title: title,),
        controller = new AnimationController(
            duration: kThemeAnimationDuration,
            vsync: vsync);
}