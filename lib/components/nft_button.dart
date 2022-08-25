import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTButton extends StatelessWidget {
  const NFTButton({
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
    return InkWell(
      onTap: onPressed ?? () {},
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 80,
            ),
        decoration: BoxDecoration(
          color: color ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 40),
        ),
        child: Text(
          text ?? '',
          textAlign: TextAlign.center,
          style: kRegularStyle.copyWith(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? kRegularSize,
          ),
        ),
      ),
    );
  }
}
