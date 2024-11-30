import 'package:flutter/material.dart';
import 'package:salfa_game/core/extensions/assetss_widgets.dart';
import 'package:salfa_game/core/utilities/app_color.dart';
import 'package:salfa_game/views/widgets/image_widget.dart';
import 'package:salfa_game/views/widgets/main_text.dart';

class MainTextField extends StatefulWidget {
  final String hint;
  final String? title;
  final bool isOptional;
  final String? label;
  final FontWeight? fontWeight;
  final Color? colorText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int maxLines;
  final String? init;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final int? maxInputLength;
  final bool hideKeyboard;
  final OutlineInputBorder? border;
  final Color? filledColor;
  final Color? borderColor;
  final bool enable;
  final void Function(String value)? onSubmit;
  final bool unfocusWhenTapOutside;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final Color? hintColor;
  final int radius;
  final bool readOnly;
  final bool obscureText;
  final double? hintFontSize;
  final TextDirection? textDirection;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  const MainTextField({
    super.key,
    this.hint = '',
    this.title,
    this.label,
    this.fontWeight,
    this.colorText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.init,
    this.maxInputLength,
    this.border,
    this.isDense = true,
    this.contentPadding,
    this.filledColor,
    this.suffix,
    this.onSubmit,
    this.enable = true,
    this.style,
    this.hideKeyboard = false,
    this.borderColor,
    this.suffixIcon,
    this.unfocusWhenTapOutside = true,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validator,
    this.radius = 20,
    this.readOnly = false,
    this.obscureText = false,
    this.hintFontSize = 14,
    this.textDirection,
    this.hintColor = Colors.grey,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.isOptional = false,
  });

  @override
  State<MainTextField> createState() => MainTextFieldState();
}

class MainTextFieldState extends State<MainTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void didUpdateWidget(MainTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller &&
        widget.controller != null) {
      controller = widget.controller!;
    }
  }

  @override
  void dispose() {
    if (mounted) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  initState() {
    obsecure = widget.obscureText;
    super.initState();
  }

  bool obsecure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...{
          4.hSize,
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 9,
              right: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MainText.title(
                  widget.title ?? '',
                  fontSize: 14,
                  color: AppColors.darkBlueColor,
                ),
                if (widget.isOptional)
                  const MainText.body(
                    '  (optional)',
                    fontSize: 13,
                  ),
              ],
            ),
          ),
          // 2.hSize,
        },
        TextFormField(
          obscuringCharacter: '*',
          obscureText: obsecure,
          controller: widget.controller,
          cursorHeight: 22.0,
          enabled: widget.enable,
          maxLines: widget.maxLines,
          maxLength: widget.maxInputLength,
          onFieldSubmitted: widget.onSubmit,
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly,
          initialValue: widget.init,
          textAlign: widget.textAlign,
          style: widget.style ??
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          focusNode: widget.focusNode,
          onTapOutside: (event) {
            if (widget.unfocusWhenTapOutside) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
          validator: widget.validator,
          textDirection: widget.textDirection ?? TextDirection.rtl,
          decoration: InputDecoration(
            isDense: widget.isDense,
            prefixIcon: widget.prefixIcon,
            suffix: widget.suffix,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
            hintText: widget.hint.isNotEmpty ? widget.hint : null,
            labelText: widget.label,
            hintStyle: TextStyle(
                color: widget.hintColor, fontSize: widget.hintFontSize),
            labelStyle: const TextStyle(color: Colors.black54, fontSize: 12),
            border: _border(
              color: widget.borderColor ?? AppColors.inputFieldsTextColor,
              radius: widget.radius,
            ),
            disabledBorder: _border(
              color: widget.borderColor ?? Colors.grey,
              radius: widget.radius,
            ),
            enabledBorder: _border(
              color: widget.borderColor ?? AppColors.inputFieldsTextColor,
              radius: widget.radius,
            ),
            focusedBorder: _border(
              color: widget.borderColor ?? AppColors.greenColor,
              radius: widget.radius,
            ),
            errorBorder: _border(
              color: Colors.red,
              radius: widget.radius,
            ),
            fillColor: widget.filledColor ?? AppColors.inputFieldsTextColor,
            filled: true,
            suffixIcon: widget.obscureText
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 10,
                      bottom: 10,
                      start: 8,
                      end: 22,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                      child: ImageWidget(
                        image: obsecure
                            ? 'assets/svgs/Hide.svg'
                            : 'assets/svgs/Show.svg',
                      ),
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({required Color color, int radius = 25}) {
    return widget.border == null
        ? OutlineInputBorder(
            borderRadius: radius.cBorder,
            borderSide: BorderSide(color: color),
          )
        : widget.border!.copyWith(borderSide: BorderSide(color: color));
  }
}
