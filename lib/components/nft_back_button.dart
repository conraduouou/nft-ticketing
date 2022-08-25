import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTBackButton extends StatelessWidget {
  const NFTBackButton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: height ?? 20,
        height: width ?? 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Icon(
          Icons.arrow_back,
          color: kDarkBlue,
        ),
      ),
    );
  }
}
