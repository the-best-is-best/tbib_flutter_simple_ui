import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

/// ElevatedButton with gradient
class MyGradientElevatedButton extends StatelessWidget {
  ///  add onPressed function
  final void Function()? _onPressed;
  final String _text;

  /// add gradient
  final Gradient _gradient;

  /// text style for label
  final TextStyle _textStyle;

  /// button style
  final ButtonStyle _buttonStyle;

  /// button width
  final double? _width;

  /// button margin
  final EdgeInsets? _margin;

  /// button radius
  final double? _radius;

  /// constructor
  const MyGradientElevatedButton({
    /// add label text
    required String text,

    /// add onPressed function
    required void Function()? onPressed,

    /// add gradient
    required Gradient gradient,

    /// text style for label
    required TextStyle textStyle,

    /// button style
    required ButtonStyle buttonStyle,

    /// button width
    double? width,

    /// button margin
    EdgeInsets? margin,

    /// button radius
    double? radius,
    super.key,
  })  : _text = text,
        _onPressed = onPressed,
        _gradient = gradient,
        _buttonStyle = buttonStyle,
        _width = width,
        _margin = margin,
        _radius = radius,
        _textStyle = textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width ?? context.width,
      margin: _width == null && _margin == null
          ? const EdgeInsets.symmetric(horizontal: 25)
          : _margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius ?? 15),
        gradient: _gradient,
      ),
      child: ElevatedButton(
        style: _buttonStyle.copyWith(
          shape: _buttonStyle.shape ??
              MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius ?? 15),
                ),
              ),
        ),
        //  ElevatedButton.styleFrom(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(_radius),
        //   ),
        //   shadowColor: Colors.transparent,
        //   backgroundColor: Colors.transparent,
        // ),
        onPressed: _onPressed,
        // () {
        //   // passwordError = passwordValidation(
        //   //     _formKey.currentState?.fields['password']!
        //   //             .value ??
        //   //         "",
        //   //     8);

        //   // setState(() {});
        //   // WidgetsBinding.instance
        //   //     .addPostFrameCallback((timeStamp) {
        //   if (_formKey != null &&
        //       !_formKey!.currentState!.saveAndValidate()) {
        //     return;
        //   }
        //   // });
        // },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MyText(
            text: _text,
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}
