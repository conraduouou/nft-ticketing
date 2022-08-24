import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.color,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.padding,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;
  final EdgeInsets? padding;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        primary: color ?? kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 80,
            ),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
      child: Text(
        text ?? '',
        style: kRegularStyle.copyWith(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? kRegularSize,
        ),
      ),
    );
  }
}
