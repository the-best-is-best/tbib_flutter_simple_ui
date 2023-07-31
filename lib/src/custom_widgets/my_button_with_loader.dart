import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/src/extensions/ext_build_context.dart';

/// typedef for function return success
typedef IsSuccess = Future<void> Function({required bool isSuccess});

/// elevated button with loader
class MyButtonWithLoader extends StatefulWidget {
  /// constructor
  const MyButtonWithLoader({
    required this.title,
    required this.onPressed,
    super.key,
    this.titleStyle,
    this.backgroundColor,
    this.elevation,
    this.width,
    this.padding,
    this.radius = 12,
    this.textColor,
  });

  /// [title] add your title
  final String title;

  /// [titleStyle] add your titleStyle
  final TextStyle? titleStyle;

  /// [backgroundColor] add your backgroundColor
  final Color? backgroundColor;

  /// [elevation] add your elevation
  final double? elevation;

  /// [width] add your width
  final double? width;

  /// [padding] add your padding
  final EdgeInsetsGeometry? padding;

  /// [radius] add your radius
  final double radius;

  /// [textColor] add your textColor
  final Color? textColor;

  /// Use To Add style and loader
  // final ButtonLoaderData buttonData;

  /// receive startLoading , stopLoading, isSuccess m btnState
  final void Function({
    Function startLoading,
    Function stopLoading,
    Function({required bool isSuccess}) isSuccess,
    ButtonSpinnerState btnState,
  }) onPressed;

  @override
  State<MyButtonWithLoader> createState() => _MyButtonWithLoaderState();
}

/// enum for button state
enum ButtonSpinnerState { Idle, loading, success }

class _MyButtonWithLoaderState extends State<MyButtonWithLoader> {
  late ButtonSpinnerState state = ButtonSpinnerState.Idle;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width:
          state != ButtonSpinnerState.Idle ? 60 : widget.width ?? context.width,
      height: state != ButtonSpinnerState.Idle ? 50 : 50,
      duration: const Duration(milliseconds: 500),
      child: state == ButtonSpinnerState.Idle
          ? ElevatedButton(
              // backgroundColor: widget.backgroundColor,
              // elevation: widget.elevation,
              // textStyle: widget.titleStyle,
              // padding: widget.padding,
              // radius: widget.radius,
              // text: widget.title,
              // textColor: widget.textColor,
              // width: widget.width,
              onPressed: () => widget.onPressed.call(
                startLoading: startLoading,
                stopLoading: stopLoading,
                isSuccess: isSuccess,
                btnState: state,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  widget.title,
                  // style: widget.titleStyle,
                ),
              ),
            )
          : _buildSpanner(isDone, state == ButtonSpinnerState.success),
    );
  }

  Widget _buildSpanner(bool isDone, bool isSuccess) {
    return Container(
      height: 50,
      width: 160,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      // decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Center(
        child: isDone
            ? Icon(
                isDone && isSuccess ? Icons.check : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 30,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }

  void startLoading() {
    state = ButtonSpinnerState.loading;
    setState(() {});
    // await Future.delayed(const Duration(seconds: 1));
  }

  void stopLoading() {
    // await Future.delayed(const Duration(seconds: 1));
    state = ButtonSpinnerState.Idle;
    isDone = false;
    setState(() {});
  }

  /// bool isSuccess == false it meaning error
  Future<void> isSuccess({required bool isSuccess}) async {
    isDone = true;
    if (isSuccess) {
      state = ButtonSpinnerState.success;
    }
    setState(() {});
    Future.delayed(const Duration(milliseconds: 50), () {
      stopLoading();
      setState(() {});
    });
  }
}
