import 'package:flutter/widgets.dart';

/// [IntExt] add methods to double
extension IntExt on int {
  /// [pxToDp] convert pixels to dp
  double pxToDp(BuildContext context) {
    // Get the device pixel ratio
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Convert pixels to dp using the formula: pixels / devicePixelRatio
    return this / devicePixelRatio;
  }
}
