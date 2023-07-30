import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/src/resources/font_manager/font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color? color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Colors.white,
    fontWeight: fontWeight,
  );
}

// light

TextStyle getLightStyle({
  double? fontSize,
  Color? color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s20,
      fontWeight: FontWeightManager.light,
      color: color);
}

// regular

TextStyle getRegularStyle({
  double? fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSize.s16,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

// medium

TextStyle getMediumStyle({
  //double fontSize = FontSize.s16,
  double? fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSize.s18,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

// semi bold

TextStyle getSemiBoldStyle({
  // double fontSize = FontSize.s18,
  double? fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSize.s16,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

// bold

TextStyle getBoldStyle({
  // double fontSize = FontSize.s20,
  double? fontSize,
  Color? color,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSize.s22,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}
