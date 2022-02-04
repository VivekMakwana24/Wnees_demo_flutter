import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wnees_demo/values/colors.dart';
import 'package:wnees_demo/values/styles.dart';

class AppTextField extends StatefulWidget {
  final String label, hint;
  final String? prefixText, errorText, error;
  final bool obscureText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextInputAction keyboardAction;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function()? onTap;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final Widget? suffixIcon;
  final String? initValue;
  final FormFieldSetter<String>? onSaved;
  final bool paddingLeft;
  final EdgeInsets? contentPadding;
  final int maxLines;
  final double height;
  final bool filled;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? onChanged;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;
  final AutovalidateMode? autoValidateMode;
  final Iterable<String>? autofillHints;
  final TextAlignVertical textAlignVertical;
  final String obscuringCharacter;
  final FloatingLabelBehavior floatingLabelBehavior;

  const AppTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.error,
    this.obscureText = false,
    this.textStyle,
    this.decoration,
    this.keyboardAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validators,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onTap,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.initValue,
    this.paddingLeft = false,
    this.contentPadding,
    this.prefixIcon,
    this.onSaved,
    this.prefixText,
    this.maxLines = 1,
    this.height = 1,
    this.filled = false,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.errorText,
    this.buildCounter,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.isDense,
    this.autoValidateMode,
    this.autofillHints,
    this.textAlignVertical = TextAlignVertical.center,
    this.obscuringCharacter = "*",
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  }) : super(key: key);

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
        minLines: 1,
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
          counterText: "",
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
        buildCounter: (BuildContext? context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
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
