import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/account_settings/account_settings.dart';

class NFTAccountPageBannerAndAvatar extends StatelessWidget {
  const NFTAccountPageBannerAndAvatar({
    Key? key,
    required this.assetPath,
    this.showSettings = true,
    this.showBackButton = false,
  }) : super(key: key);

  final String assetPath;
  final bool showSettings;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        _NFTAccountPageBanner(
          showBackButton: showBackButton,
          showSettings: showSettings,
        ),
        Positioned(
          left: size.width / 2 - 40,
          top: 60,
          child: Image.asset(
            assetPath,
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
    this.showSettings = true,
    this.showBackButton = false,
  }) : super(key: key);

  final bool showSettings;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(color: kPrimaryColor),
          showSettings
              ? Positioned(
                  right: 20,
                  bottom: 20,
                  height: 20,
                  width: 20,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () =>
                        Navigator.of(context).pushNamed(AccountSettings.id),
                    child: SvgPicture.asset(
                      'assets/icons/ic-settings.svg',
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
          showBackButton
              ? const Positioned(
                  bottom: 20,
                  left: 20,
                  height: 40,
                  width: 40,
                  child: NFTBackButton(),
                )
              : Container()
        ],
      ),
    );
  }
}
