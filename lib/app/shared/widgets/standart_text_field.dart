import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/asset/image_asset.dart';

class StandardTextField extends StatefulWidget {
  final CompoundableFormatter compoundableFormatter;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final bool enabled;
  final bool shouldValidate;
  final Color? fillColor;
  final TextAlign textAlign;
  final bool shouldIgnorePadding;
  final EdgeInsetsGeometry? padding;
  final bool? notShowErrorText;
  final bool isSensitive;
  final String? suffixIconPath;
  final bool isOptional;
  final bool editable;
  final int? maxLines;

  const StandardTextField({
    super.key,
    required this.compoundableFormatter,
    this.onChanged,
    this.focusNode,
    required this.controller,
    this.errorText,
    this.enabled = true,
    this.shouldValidate = true,
    this.fillColor = Colors.transparent,
    this.textAlign = TextAlign.left,
    this.shouldIgnorePadding = false,
    this.onEditingComplete,
    this.isSensitive = false,
    this.padding,
    this.suffixIconPath,
    this.notShowErrorText,
    this.isOptional = false,
    this.editable = true,
    this.maxLines = 1,
  });

  @override
  State<StandardTextField> createState() => _StandardTextFieldState();
}

class _StandardTextFieldState extends State<StandardTextField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: widget.isOptional,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      AppStrings.optionalLabelTip,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            maxLines: widget.maxLines,
            maxLength: widget.compoundableFormatter.maxLength,
            onEditingComplete: widget.onEditingComplete,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
            autofillHints: widget.compoundableFormatter.autofillHints,
            onChanged: widget.onChanged,
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.compoundableFormatter.textInputType,
            textAlign: widget.textAlign,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.shouldValidate
                ? widget.compoundableFormatter.validator
                : null,
            inputFormatters: [
              widget.compoundableFormatter.inputFormatter,
              widget.compoundableFormatter.label == AppStrings.numberLabel
                  ? FilteringTextInputFormatter.digitsOnly
                  : MaskTextInputFormatter(),
              widget.compoundableFormatter.obscure
                  ? FilteringTextInputFormatter.deny(RegExp(r'\s'))
                  : MaskTextInputFormatter(),
            ],
            obscureText: _showPassword && widget.compoundableFormatter.obscure,
            decoration:
                _buildInputDecoration(theme, widget.errorText, widget.enabled),
            enabled: widget.enabled && widget.editable,
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      ThemeData theme, String? errorText, bool enabled) {
    return InputDecoration(
      alignLabelWithHint: true,
      errorStyle: widget.notShowErrorText == true
          ? const TextStyle(height: 0)
          : const TextStyle(height: 0.5),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          widget.compoundableFormatter.label,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      errorBorder: _buildOutlineErrorInputBorder(),
      suffixIcon: _buildSuffixIcon(),
      counterText: '',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      hintText: widget.compoundableFormatter.hint,
      hintStyle: const TextStyle(
          color: Color.fromARGB(255, 103, 103, 103),
          fontWeight: FontWeight.w400),
      enabledBorder: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputFocusedBorder(),
      focusedErrorBorder: _buildOutlineErrorInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
      errorText: errorText,
      fillColor: widget.fillColor,
      filled: true,
    );
  }

  Widget? _buildSuffixIcon() {
    return widget.compoundableFormatter.obscure || widget.suffixIconPath != null
        ? Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: widget.suffixIconPath != null
                  ? SvgPicture.asset(
                      widget.suffixIconPath ?? '',
                    )
                  : SvgPicture.asset(
                      _showPassword ? ImageAsset.eyeSlash : ImageAsset.eyeSlash,
                      //TODO Change to eye icon MOOSES Corrigir isso
                      height: 22,
                      colorFilter: const ColorFilter.mode(
                          Colors.black26, BlendMode.srcIn),
                    ),
              onPressed: () => widget.suffixIconPath != null
                  ? null
                  : setState(() {
                      _showPassword = !_showPassword;
                    }),
            ),
          )
        : null;
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      gapPadding: 1,
      borderSide: widget.enabled
          ? const BorderSide(color: Colors.black, width: 1.5)
          : const BorderSide(color: Colors.black, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder _buildOutlineErrorInputBorder() {
    return const OutlineInputBorder(
      gapPadding: 2,
      borderSide: BorderSide(color: Colors.red, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder _buildOutlineInputFocusedBorder() {
    return const OutlineInputBorder(
      gapPadding: 1,
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
