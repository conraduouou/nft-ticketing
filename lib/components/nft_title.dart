import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/constants.dart';

class NFTTitle extends StatelessWidget {
  const NFTTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            'Review Order',
            style: kRegularStyle.copyWith(
              color: Colors.white,
            ),
          ),
          const Positioned(
            left: 0,
            child: NFTBackButton(
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
