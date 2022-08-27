import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTBackButton extends StatelessWidget {
  const NFTBackButton({
    Key? key,
    this.height,
    this.width,
    this.isClose = false,
    this.onPressed,
  }) : super(key: key);

  final double? height;
  final double? width;
  final bool isClose;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.of(context).pop(),
      child: Container(
        width: height ?? 20,
        height: width ?? 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          !isClose ? Icons.arrow_back : Icons.close,
          color: kDarkBlue,
        ),
      ),
    );
  }
}
