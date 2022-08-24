import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_ticketing/constants.dart';

class NFTField extends StatefulWidget {
  const NFTField({
    Key? key,
    this.width,
    this.radius,
    this.color,
    this.initialText,
    this.hintText,
    this.enabled = true,
    this.isDigitsOnly = false,
    this.isObscured = false,
    this.onChanged,
  }) : super(key: key);

  final double? width;
  final double? radius;
  final Color? color;
  final String? initialText;
  final String? hintText;
  final bool enabled;
  final bool isDigitsOnly;
  final bool isObscured;
  final void Function(String)? onChanged;

  @override
  State<NFTField> createState() => _NFTFieldState();
}

class _NFTFieldState extends State<NFTField> {
  late TextEditingController _controller;
  late bool isObscured;
  late bool isEmpty;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);
    isObscured = widget.isObscured ? true : false;
    isEmpty = !widget.isObscured &&
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
      width: widget.width,
      child: TextField(
        obscureText: isObscured,
        inputFormatters: widget.isDigitsOnly
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        controller: _controller,
        style: kRegularStyle.copyWith(color: Colors.white),
        cursorColor: Colors.white,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            enabled: widget.enabled,
            filled: true,
            fillColor: widget.color ?? kSlightlyDarkBlue,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: kRegularStyle.copyWith(color: Colors.white),
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
            ),
            suffixIcon: widget.isObscured
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
                : !isEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.clear();
                          });
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox()),
      ),
    );
  }
}
