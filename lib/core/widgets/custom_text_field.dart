import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/theme/color_palette.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final String? label;
  final bool? enabled;
  final TextStyle? textStyle;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;
  final TextDirection? textDirection;
  final EdgeInsets? edgeInsets;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.label,
    this.enabled,
    this.textStyle,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.prefixIcon,
    this.icon,
    this.action,
    this.focusNode,
    this.textDirection,
    this.edgeInsets = const EdgeInsets.only(
      top: 14,
      right: 16,
      left: 16,
      bottom: 14,
    ),
    this.hintColor = Colors.red,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      textDirection: widget.textDirection,
      controller: widget.controller,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: widget.obscuringCharacter ?? '*',
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: widget.textStyle ??
          theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF222222),
            fontWeight: FontWeight.w500,
          ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      cursorColor: theme.primaryColor,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF777777),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: BoxConstraints(minWidth: 56),
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              )
            : widget.suffixWidget,
        hintText: widget.hint,
        hintStyle: TextStyle(
            fontFamily: "Inter", fontSize: 16, color: widget.hintColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.generalGrayColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorPalette.generalGrayColor,
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(
          color: Color(0xFFCC0000),
          fontSize: 12,
        ),
        errorMaxLines: 6,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorPalette.generalGrayColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
