import 'package:flutter/widgets.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

/// add text
class MyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  /// add text
  const MyText({required this.text, super.key, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? getRegularStyle(),
      textAlign: textAlign,
    );
  }
}
