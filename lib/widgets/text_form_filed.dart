// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:wnees_demo/values/colors.dart';
import 'package:wnees_demo/values/styles.dart';

class AppTextField extends StatefulWidget {
  String label, errorText, prefixText;
  String hint;
  String error;
  bool obscureText;
  TextStyle textStyle;
  InputDecoration decoration;
  TextInputAction keyboardAction;
  TextInputType keyboardType;
  MultiValidator validators;
  List<TextInputFormatter> inputFormatters;
  InputCounterWidgetBuilder buildCounter;
  int maxLength;
  Widget prefixIcon;
  bool enabled;
  TextEditingController controller;
  FocusNode focusNode;
  Function onTap;
  bool readOnly;
  bool enableInteractiveSelection;
  Widget suffixIcon;
  String initValue;
  FormFieldSetter<String> onSaved;
  bool paddingLeft;
  EdgeInsets contentPadding;
  int maxLines;
  int minLines;
  double height;
  bool filled;
  Widget suffix;
  Widget prefix;
  Function onChanged;

  AppTextField({
    String label,
    String hint,
    String error,
    bool obscureText = false,
    TextStyle textStyle,
    InputDecoration decoration,
    TextInputAction keyboardAction = TextInputAction.next,
    TextInputType keyboardType = TextInputType.text,
    MultiValidator validators,
    List<TextInputFormatter> inputFormatters,
    int maxLength,
    bool enabled = true,
    TextEditingController controller,
    FocusNode focusNode,
    Function onTap,
    bool readOnly = false,
    bool enableInteractiveSelection = true,
    Widget suffixIcon,
    String initValue,
    bool paddingLeft = false,
    EdgeInsets contentPadding,
    Widget prefixIcon,
    FormFieldSetter<String> onSaved,
    String prefixText,
    int maxLine = 1,
    int minLines = 1,
    double height = 1,
    bool filled = false,
    Widget suffix,
    Widget prefix,
    Function onChanged,
  }) {
    this.label = label;
    this.hint = hint;
    this.error = error;
    this.obscureText = obscureText;
    this.decoration = decoration;
    this.textStyle = textStyle;
    this.keyboardAction = keyboardAction;
    this.keyboardType = keyboardType;
    this.validators = validators;
    this.contentPadding = contentPadding;
    this.inputFormatters = inputFormatters;
    this.maxLength = maxLength;
    this.enabled = enabled;
    this.focusNode = focusNode;
    this.controller = controller;
    this.onTap = onTap;
    this.readOnly = readOnly;
    this.enableInteractiveSelection = enableInteractiveSelection;
    this.suffixIcon = suffixIcon;
    this.onSaved = onSaved;
    this.initValue = initValue;
    this.prefixIcon = prefixIcon;
    this.prefixText = prefixText;
    this.paddingLeft = paddingLeft;
    this.maxLines = maxLine;
    this.minLines = minLines;
    this.height = height;
    this.filled = filled;
    this.suffix = suffix;
    this.onChanged = onChanged;
  }

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: widget.filled ? colorTextFieldBg : transparent),
      child: TextFormField(
        initialValue: widget.initValue,
        onSaved: widget.onSaved,
        cursorColor: primaryColor,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        controller: widget.controller,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        expands: false,
        autofocus: false,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        style: widget.textStyle,
        obscureText: widget.obscureText,
        validator: widget.validators,
        keyboardType: widget.keyboardType,
        textInputAction: widget.keyboardAction,
        onChanged: widget.onChanged,
        onFieldSubmitted: (_) => submit(),
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        obscuringCharacter: "⬤",
        decoration: InputDecoration(
          counterStyle: textMedium.copyWith(color: colorHint.withOpacity(0.50)),
          filled: false,
          prefixText: widget.prefixText,
          prefix: widget.prefix,
          prefixStyle: textMedium.copyWith(color: Colors.black),
          //height: 2.0 * 10
          prefixIcon: widget.prefixIcon,
          // fillColor: widget.filled ? colorTextFieldBg : transparent,
          hintText: widget.hint,
          hintMaxLines: 1,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          hintStyle: textMedium.copyWith(
            color: colorHint.withOpacity(0.50),
          ),
          errorStyle: textMedium.copyWith(color: redColor),
          errorMaxLines: 2,
          errorText: widget.error,
          alignLabelWithHint: true,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.only(
                  left: 15.0, bottom: 18.0, top: 18.0, right: 15),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        buildCounter: (BuildContext context,
                {int currentLength, int maxLength, bool isFocused}) =>
            null,
      ),
    );
  }

  void submit() {
    switch (widget.keyboardAction) {
      case TextInputAction.done:
        FocusScope.of(context).unfocus();
        break;
      case TextInputAction.next:
        FocusScope.of(context).nextFocus();
        break;
      default:
        FocusScope.of(context).nextFocus();
        break;
    }
  }
}
