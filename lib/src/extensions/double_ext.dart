import 'package:flutter/widgets.dart';

/// [DoubleExt] add methods to double
extension DoubleExt on double {
  /// [pxToDp] convert pixels to dp
  double pxToDp(BuildContext context) {
    // Get the device pixel ratio
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Convert pixels to dp using the formula: pixels / devicePixelRatio
    return this / devicePixelRatio;
  }
}
