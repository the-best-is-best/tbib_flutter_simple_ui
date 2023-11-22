import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

/// build your form field
class MyDatePicker extends StatefulWidget {
  /// [keyWidget] add your keyWidget
  final String keyWidget;

  /// [formFieldStyle] add your formFieldStyle
  final TextStyle? formFieldStyle;

  /// [styleFormFieldTitle] add your styleFormFieldTitle
  final TextStyle? styleFormFieldTitle;

  /// [label] add your label
  final String label;

  final DateTime? lastDate;

  // /// [onSaved] add your onSaved
  // final void Function(String?)? onSaved;

  final TextStyle? labelStyle;

  final String? hintText;

  final TextStyle? hintStyle;

  final FocusNode? focusNode;

  final FocusNode? nextFocusNode;

  /// [validator] add your validator
  final String? Function(DateTime?)? validator;

  /// [initialValue] add your initialValue
  final DateTime? initialValue;

  /// [keyboardType] add your keyboardType
  final TextInputType keyboardType;

  /// [prefixIcon] add your prefixIcon
  final Widget? prefixIcon;

  /// [suffixIcon] add your suffixIcon
  final Widget? suffixIcon;

  /// [obscureText] add your obscureText like password
  final bool obscureText;

  /// [decoration] add your decoration
  final InputDecoration? decoration;

  final String? errorText;

  final void Function(DateTime?)? onSaved;

  final DateFormat? format;

  final DateTime? firstDate;

  final InputType inputType;

  /// constructor
  const MyDatePicker({
    required this.keyWidget,
    required this.label,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.lastDate,
    this.format,
    this.firstDate,

    // this.onSaved,
    this.styleFormFieldTitle,
    super.key,
    this.focusNode,
    this.nextFocusNode,
    this.validator,
    this.initialValue,
    this.keyboardType = TextInputType.datetime,
    this.formFieldStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.decoration,
    this.errorText,
    this.onSaved,
    this.inputType = InputType.date,
  });

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: widget.keyWidget,
      lastDate: widget.lastDate,
      style: widget.formFieldStyle ??
          getBoldStyle(fontSize: FontSize.s16, color: const Color(0xff1E2940)),
      //   controller: _controllerUsername,
      keyboardType: widget.keyboardType,
      format: widget.format ?? DateFormat('dd-MM-yyyy'),
      firstDate: widget.firstDate,
      initialDate: widget.initialValue,
      obscureText: widget.obscureText,
      inputType: widget.inputType,

      onSaved: widget.onSaved,
      decoration: widget.decoration != null
          ? widget.decoration!.copyWith(
              labelText: widget.label,
              errorText: widget.errorText,
              labelStyle: widget.labelStyle ??
                  getBoldStyle(
                    fontSize: FontSize.s20,
                    color: const Color(0xffcdcdcd),
                  ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
            )
          : InputDecoration(
              errorText: widget.errorText,
              labelText: widget.label,
              hintText: widget.hintText,
              errorMaxLines: 6,
              labelStyle: widget.labelStyle ??
                  getBoldStyle(
                    fontSize: FontSize.s20,
                    color: const Color(0xff414141),
                  ),
              hintStyle: widget.hintStyle ??
                  getBoldStyle(
                    fontSize: FontSize.s16,
                    color: const Color(0xffcdcdcd),
                  ),
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
