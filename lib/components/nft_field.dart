import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_ticketing/constants.dart';

class NFTField extends StatefulWidget {
  const NFTField({
    Key? key,
    this.maxLength,
    this.fontSize,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.hintColor,
    this.initialText,
    this.hintText,
    this.enabled = true,
    this.isDigitsOnly = false,
    this.isObscurable = false,
    this.isClearable = true,
    this.padding,
    this.textAlign,
    this.onChanged,
    this.onClear,
    this.prefixIcon,
  }) : super(key: key);

  final int? maxLength;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? hintColor;
  final String? initialText;
  final String? hintText;
  final bool enabled;
  final bool isDigitsOnly;
  final bool isObscurable;
  final bool isClearable;
  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final VoidCallback? onClear;

  final Widget? prefixIcon;

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
      child: TextField(
        controller: _controller,
        cursorColor: Colors.white,
        inputFormatters: formatters,
        obscureText: isObscured,
        onChanged: widget.onChanged,
        textAlign: widget.textAlign ?? TextAlign.start,
        style: kRegularStyle.copyWith(
          color: Colors.white,
          fontSize: widget.fontSize,
        ),
        decoration: InputDecoration(
          contentPadding: widget.padding ?? const EdgeInsets.all(15),
          enabled: widget.enabled,
          filled: true,
          fillColor: widget.color ?? kSlightlyDarkBlue,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          hintStyle: kRegularStyle.copyWith(
            color: widget.hintColor ?? Colors.white,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 32,
            maxWidth: 60,
          ),
          suffixIcon: widget.isObscurable
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
                  : null,
        ),
      ),
    );
  }
}
