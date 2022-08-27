import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAccountPageBannerAndAvatar extends StatelessWidget {
  const NFTAccountPageBannerAndAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const _NFTAccountPageBanner(),
        Positioned(
          left: size.width / 2 - 40,
          top: 60,
          child: Image.asset(
            'assets/community/img-avatar-2@3x.png',
            height: 80,
            width: 80,
          ),
        ),
      ],
    );
  }
}

class _NFTAccountPageBanner extends StatelessWidget {
  const _NFTAccountPageBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(color: kPrimaryColor),
          Positioned(
            right: 20,
            bottom: 20,
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              'assets/icons/ic-settings.svg',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
