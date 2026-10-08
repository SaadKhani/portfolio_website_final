import 'package:flutter/material.dart';

import 'breakpoints.dart';

class Responsive {
  Responsive._();

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < AppBreakpoints.mobile;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= AppBreakpoints.tablet;
  }

  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static EdgeInsets pagePadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < AppBreakpoints.mobile) {
      return const EdgeInsets.symmetric(horizontal: 20);
    }

    if (width < AppBreakpoints.tablet) {
      return const EdgeInsets.symmetric(horizontal: 40);
    }

    if (width < AppBreakpoints.desktop) {
      return const EdgeInsets.symmetric(horizontal: 70);
    }

    return const EdgeInsets.symmetric(horizontal: 100);
  }

  static int gridColumns(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < AppBreakpoints.mobile) {
      return 1;
    }

    if (width < AppBreakpoints.tablet) {
      return 2;
    }

    if (width < AppBreakpoints.desktop) {
      return 3;
    }

    return 4;
  }
}
