import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool isDesktop() {
    if ((height() > 360 && width() > 800) ||
        (width() > 360 && height() > 800)) {
      // if ((height > 960 && width > 1440) || (width > 960 && height > 1440)) {
      return true;
    }
    return false;
  }

  double height() {
    return MediaQuery.of(this).size.height;
  }

  double width() {
    return MediaQuery.of(this).size.width;
  }
}
