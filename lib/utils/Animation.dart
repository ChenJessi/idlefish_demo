


import 'package:flutter/widgets.dart';

class AnimUtils{
  /**
   * 页面切换平移动画
   */
  static SlideTransition createTransition(Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }



}