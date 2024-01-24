import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension ScreenNavigation on BuildContext {
  Future<T?> pushWithFadeTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.fade,
        child: page,
      ),
    );
  }

  Future<T?> pushWithRightToLeftTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: page,
      ),
    );
  }

  Future<T?> pushWithRightToLeftJoinedTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.rightToLeftJoined,
        child: page,
      ),
    );
  }

  Future<T?> pushWithLeftToRightTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: page,
      ),
    );
  }

  Future<T?> pushWithUpToDownTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.topToBottom,
        child: page,
      ),
    );
  }

  Future<T?> pushWithDownToUpTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: page,
      ),
    );
  }

  Future<T?> pushWithScaleTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        child: page,
      ),
    );
  }

  Future<T?> pushWithRotateTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.rotate,
        alignment: Alignment.center,
        child: page,
      ),
    );
  }

  Future<T?> pushWithSizeTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.size,
        alignment: Alignment.center,
        child: page,
      ),
    );
  }

  Future<T?> pushWithRightToLeftWithFadeTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.rightToLeftWithFade,
        child: page,
      ),
    );
  }

  Future<T?> pushWithLeftToRightWithFadeTransition<T>(Widget page) {
    return Navigator.push(
      this,
      PageTransition(
        type: PageTransitionType.leftToRightWithFade,
        child: page,
      ),
    );
  }
}