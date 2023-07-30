import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tbib_file_uploader/tbib_file_uploader.dart';

/// Start App Widget
class StartAppWidget extends StatefulWidget {
  /// constructor
  const StartAppWidget({
    // required this.child,
    required this.startWidgetApp,
    super.key,
    this.designSize = const Size(375, 812),
    this.themeData,
  });

  /// design size
  final Size designSize;

  // /// use material app or cupertino app
  // final Widget child;

  /// [themeData] add your themeData
  final ThemeData? themeData;

  /// [startWidgetApp] add your startWidgetApp as MaterialApp or CupertinoApp
  final Widget startWidgetApp;
  @override
  State<StartAppWidget> createState() => _StartAppWidgetState();
}

class _StartAppWidgetState extends State<StartAppWidget> {
  @override
  void initState() {
    super.initState();
    TBIBFileUploader().init();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
      child: widget.startWidgetApp,
    );
  }
}
