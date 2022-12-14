import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_ticketing/constants.dart';

class NFTField extends StatefulWidget {
  const NFTField({
    Key? key,
    this.color,
    this.fontSize,
    this.height,
    this.hintColor,
    this.hintText,
    this.initialText,
    this.maxLength,
    this.maxLines,
    this.padding,
    this.radius,
    this.textAlign,
    this.onChanged,
    this.onClear,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.enabled = true,
    this.isBordered = false,
    this.isClearable = true,
    this.isDigitsOnly = false,
    this.isObscurable = false,
    this.requestFocus = false,
    this.showSuffix = true,
    this.focusNode,
  }) : super(key: key);

  final Color? color;
  final double? fontSize;
  final double? height;
  final Color? hintColor;
  final String? hintText;
  final String? initialText;
  final int? maxLength;
  final int? maxLines;
  final EdgeInsets? padding;
  final double? radius;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final double? width;

  final bool enabled;
  final bool isBordered;
  final bool isClearable;
  final bool isDigitsOnly;
  final bool isObscurable;
  final bool requestFocus;
  final bool showSuffix;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final FocusNode? focusNode;

  @override
  State<NFTField> createState() => _NFTFieldState();
}

class _NFTFieldState extends State<NFTField> {
  late TextEditingController _controller;
  late bool isObscured;
  late bool isEmpty;
  late final formatters = <TextInputFormatter>[];

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);
    isObscured = widget.isObscurable ? true : false;
    isEmpty = (!widget.isObscurable && widget.isClearable) &&
        (widget.initialText == null || widget.initialText!.isEmpty);

    _controller.addListener(() {
      setState(() {
        if (_controller.text.isNotEmpty) {
          isEmpty = false;
        } else {
          isEmpty = true;
        }
      });
    });

    if (widget.isDigitsOnly) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    if (widget.maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(widget.maxLength));
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant NFTField oldWidget) {
    _controller.value = TextEditingValue(
      text: widget.initialText ?? '',
      selection: TextSelection.fromPosition(
          TextPosition(offset: (widget.initialText ?? '').length)),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Focus(
        focusNode: widget.focusNode,
        child: TextField(
          autofocus: widget.requestFocus,
          controller: _controller,
          cursorColor: Colors.white,
          inputFormatters: formatters,
          obscureText: isObscured,
          onChanged: widget.onChanged,
          maxLines: isObscured ? 1 : widget.maxLines ?? 1,
          textAlign: widget.textAlign ?? TextAlign.start,
          style: kRegularStyle.copyWith(
            color: Colors.white,
            fontSize: widget.fontSize,
          ),
          onTap: widget.onTap,
          // () {
          //   if (widget.onTap != null) {
          //     final focus = FocusManager.instance.primaryFocus;

          //     if (focus != null) focus.unfocus();
          //     widget.onTap!();
          //   }
          // },
          decoration: InputDecoration(
            contentPadding: widget.padding ?? const EdgeInsets.all(15),
            enabled: widget.enabled,
            filled: true,
            fillColor: widget.color ?? kSlightlyDarkBlue,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderSide: widget.isBordered
                  ? const BorderSide(color: kGrayishBlue, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
            ),
            enabledBorder: widget.isBordered
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: kGrayishBlue, width: 1),
                  )
                : null,
            focusedBorder: widget.isBordered
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: kGrayishBlue, width: 1),
                  )
                : null,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintStyle: kRegularStyle.copyWith(
              fontSize: widget.fontSize,
              color: widget.hintColor ?? Colors.white,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 32,
              maxWidth: 60,
            ),
            suffixIcon: widget.showSuffix
                ? widget.suffixIcon ??
                    (widget.isObscurable
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscured = !isObscured;
                              });
                            },
                            child: Icon(
                              isObscured
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white,
                            ),
                          )
                        : !isEmpty && widget.isClearable
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controller.clear();
                                  });

                                  if (widget.onClear != null) widget.onClear!();
                                },
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                ),
                              )
                            : null)
                : null,
          ),
        ),
      ),
    );
  }
}
