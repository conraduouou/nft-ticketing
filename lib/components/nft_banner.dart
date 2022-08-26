import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';

class NFTBanner extends StatelessWidget {
  const NFTBanner({
    Key? key,
    // ignore: unused_element
    this.assetPath,
    this.height,
    this.boxFit,
  }) : super(key: key);

  final String? assetPath;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          assetPath ??
              'assets/event_details/img-banner-1@2x.png', // remove in prod
          fit: boxFit,
          height: height,
          width: size.width,
        ),
        const Positioned(
          top: 30,
          left: 20,
          child: NFTBackButton(
            height: 40,
            width: 40,
          ),
        )
      ],
    );
  }
}
