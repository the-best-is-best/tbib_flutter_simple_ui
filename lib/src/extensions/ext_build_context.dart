import 'package:flutter/material.dart';

/// Extension for BuildContext
extension ExtBuildContext on BuildContext {
  /// get screen orientation
  bool get isLandscape => orientation == Orientation.landscape;

  /// get height of screen
  double get height => MediaQuery.of(this).size.height;

  /// get width of screen
  double get width => MediaQuery.of(this).size.width;

  /// get screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// get screen width
  double get screenWidth => screenSize.width;

  /// get screen height
  double get screenHeight => screenSize.height;

  /// get screen orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// get screen text scale factor
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// get screen padding
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// get screen view padding
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// get screen view insets
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// get screen view insets
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;

  /// get screen view insets
  double get viewInsetsTop => MediaQuery.of(this).viewInsets.top;

  /// get screen view insets
  double get viewInsetsLeft => MediaQuery.of(this).viewInsets.left;

  /// get screen view insets
  double get viewInsetsRight => MediaQuery.of(this).viewInsets.right;

  /// get screen view insets
  double get viewInsetsHorizontal => MediaQuery.of(this).viewInsets.horizontal;

  /// get screen view insets
  double get viewInsetsVertical => MediaQuery.of(this).viewInsets.vertical;

  /// get screen view insets
  double get viewPaddingBottom => MediaQuery.of(this).viewPadding.bottom;

  /// get screen view insets
  double get viewPaddingTop => MediaQuery.of(this).viewPadding.top;

  /// get screen view insets
  double get viewPaddingLeft => MediaQuery.of(this).viewPadding.left;

  /// get screen view insets
  double get viewPaddingRight => MediaQuery.of(this).viewPadding.right;

  /// get screen view insets
  double get viewPaddingHorizontal =>
      MediaQuery.of(this).viewPadding.horizontal;

  /// get screen view insets
  double get viewPaddingVertical => MediaQuery.of(this).viewPadding.vertical;

  /// get screen view insets
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  /// get screen view insets
  double get paddingTop => MediaQuery.of(this).padding.top;

  /// get screen view insets
  double get paddingLeft => MediaQuery.of(this).padding.left;

  /// get screen view insets
  double get paddingRight => MediaQuery.of(this).padding.right;
}
