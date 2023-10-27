import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

///get Default theme app
class DefaultThemeApp {
  /// get default theme
  ThemeData defaultTheme({
    required Color primaryColor,
    required Color secondColor,
    Color? buttonsColor,
    Color? canvasColor,
    //  required Color accentColor,
  }) {
    final colorScheme = ThemeData().colorScheme.copyWith(
          primary: primaryColor,
          primaryContainer: primaryColor.withOpacity(.7),
          secondary: secondColor,
          secondaryContainer: secondColor.withOpacity(.7),
          surface: primaryColor,
          onSurface: secondColor,
          background: primaryColor,
          onBackground: secondColor,
          error: Colors.red.shade900,
          onError: Colors.red.shade800,
          brightness: Brightness.light,
          onPrimary: secondColor,
          onSecondary: primaryColor,

          //  secondaryVariant: accentColor,
        );
    final isDark = colorScheme.brightness == Brightness.dark;

    final primarySurfaceColor =
        isDark ? colorScheme.surface : colorScheme.primary;
    final onPrimarySurfaceColor =
        isDark ? colorScheme.onSurface : colorScheme.onPrimary;

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      primaryColor: primarySurfaceColor,

      canvasColor: canvasColor ?? primaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      dialogBackgroundColor: colorScheme.background,
      indicatorColor: onPrimarySurfaceColor,
      applyElevationOverlayColor: isDark,
      fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        elevation: myAppBarTheme(primaryColor).elevation,
        selectedItemColor: secondColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: getRegularStyle(
          color: primaryColor,
          fontSize: 10.sp,
        ),
        unselectedLabelStyle: getRegularStyle(
          color: Colors.grey,
          fontSize: 10.sp,
        ),
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
      ),

      appBarTheme: myAppBarTheme(primaryColor),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),

      badgeTheme: BadgeThemeData(
        backgroundColor: primaryColor,
        largeSize: 20,
        smallSize: 10,
        textColor: Colors.white,
        offset: const Offset(15, -12),
        padding: const EdgeInsets.all(5),
        textStyle: getRegularStyle(
          color: Colors.white,
          fontSize: 10.sp,
        ),
      ),
      iconTheme: IconThemeData(color: buttonsColor ?? primaryColor),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(buttonsColor ?? primaryColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // backgroundColor: MaterialStateProperty.all(
          //   buttonsColor ?? primaryColor,
          // ),
        ),
      ),
      elevatedButtonTheme: myElevatedButtonTheme(buttonsColor ?? primaryColor),
      // inputDecorationTheme: InputDecorationTheme(
      //   contentPadding: const EdgeInsets.symmetric(
      //     vertical: 10,
      //     horizontal: 20,
      //   ),
      //   constraints: const BoxConstraints(
      //     minHeight: 60,
      //   ),
      //   //filled: true,
      //   //fillColor: Colors.grey[200],

      //   iconColor: buttonsColor ?? secondColor,
      //   suffixIconColor: secondColor,
      //   prefixIconColor: secondColor,
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: const BorderSide(
      //       color: Colors.red,
      //     ),
      //   ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor.withOpacity(.5),
        selectionHandleColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        constraints: const BoxConstraints(
          minHeight: 60,
        ),
        //filled: true,
        //fillColor: Colors.grey[200],

        iconColor: secondColor,
        suffixIconColor: secondColor,
        prefixIconColor: secondColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.shade900,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.shade700,
          ),
        ),
        labelStyle: getRegularStyle(
          fontSize: FontSize.s16,
          color: primaryColor,
        ),
        hintStyle: getRegularStyle(
          color: Colors.grey.shade600,
          fontSize: 14.sp,
        ),
        errorStyle: getRegularStyle(
          color: Colors.red.shade900,
          fontSize: 14.sp,
        ),
      ),
      // FluidNavBarStyle(
      //   //     iconUnselectedForegroundColor: Colors.black,
      //   //     iconSelectedForegroundColor: AppColor.primaryColor.withOpacity(.1),
      //   //     barBackgroundColor: AppColor.secondColor,
      //   //     iconBackgroundColor: AppColor.primaryColor),

      colorScheme: colorScheme,
      bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.surface),
      // colorScheme: ColorScheme(
      //   primary: primaryColor,
      //   secondary: secondColor,
      //   surface: Colors.white,
      //   background: Colors.white,
      //   error: Colors.red,
      //   onPrimary: Colors.white,
      //   onSecondary: Colors.white,
      //   onSurface: Colors.white,
      //   onBackground: Colors.white,
      //   onError: Colors.white,
      //   brightness: Brightness.light,
      // ).copyWith(error: colorScheme.error),
    );
  }
}

/// get app bar theme
AppBarTheme myAppBarTheme(Color primaryColor) {
  return AppBarTheme(
    backgroundColor: primaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: getBoldStyle(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    shape: ShapeBorder.lerp(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      1,
    ),
  );
}

/// get elevatedButton theme
ElevatedButtonThemeData myElevatedButtonTheme(Color primaryColor) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      foregroundColor: const MaterialStatePropertyAll<Color>(
        Colors.white,
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        getBoldStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}
