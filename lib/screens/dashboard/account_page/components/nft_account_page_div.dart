import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAccountPageDiv extends StatelessWidget {
  const NFTAccountPageDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kSlightlyDarkBlue,
      height: 60,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}
