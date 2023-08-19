import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tbib_flutter_simple_ui/src/resources/font_manager/style_manager.dart';

/// build your form field
class MyFormField extends StatefulWidget {
  /// constructor
  const MyFormField({
    required this.keyWidget,
    required this.label,
    // this.onSaved,
    this.styleFormFieldTitle,
    super.key,
    this.focusNode,
    this.nextFocusNode,
    this.validator,
    this.initialValue,
    this.keyboardType,
    this.formFieldStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.decoration,
  });

  /// [keyWidget] add your keyWidget
  final String keyWidget;

  /// [formFieldStyle] add your formFieldStyle
  final TextStyle? formFieldStyle;

  /// [styleFormFieldTitle] add your styleFormFieldTitle
  final TextStyle? styleFormFieldTitle;

  /// [label] add your label
  final String label;

  final FocusNode? focusNode;

  final FocusNode? nextFocusNode;

  /// [validator] add your validator
  final String? Function(String?)? validator;

  /// [initialValue] add your initialValue
  final String? initialValue;

  // /// [onSaved] add your onSaved
  // final void Function(String?)? onSaved;

  /// [keyboardType] add your keyboardType
  final TextInputType? keyboardType;

  /// [prefixIcon] add your prefixIcon
  final Widget? prefixIcon;

  /// [suffixIcon] add your suffixIcon
  final Widget? suffixIcon;

  /// [obscureText] add your obscureText like password
  final bool obscureText;

  /// [decoration] add your decoration
  final InputDecoration? decoration;

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.keyWidget,

      style: widget.formFieldStyle ?? getRegularStyle(),
      //   controller: _controllerUsername,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: widget.decoration != null
          ? widget.decoration!.copyWith(
              labelText: widget.decoration?.labelText ?? widget.label,
              prefixIcon: widget.decoration?.prefixIcon ?? widget.prefixIcon,
              suffixIcon: widget.decoration?.suffixIcon ?? widget.suffixIcon,
            )
          : InputDecoration(
              labelText: widget.label,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
            ),
      onEditingComplete: widget.nextFocusNode == null
          ? null
          : () {
              widget.focusNode?.unfocus();
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            },
      validator: widget.validator,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      // onSaved: widget.onSaved,
    );
  }
}
