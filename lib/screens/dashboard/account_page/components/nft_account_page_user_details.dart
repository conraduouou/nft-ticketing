import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_vertical_div.dart';

class NFTAccountPageUserDetails extends StatelessWidget {
  const NFTAccountPageUserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: '15',
            subText: 'Posts',
          ),
        ),
        NFTAccountPageVerticalDiv(),
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: '13',
            subText: 'Following',
          ),
        ),
        NFTAccountPageVerticalDiv(),
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: '20',
            subText: 'Followers',
          ),
        ),
      ],
    );
  }
}

class _NFTAccountPageUserDetailsBlock extends StatelessWidget {
  const _NFTAccountPageUserDetailsBlock({
    Key? key,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mainText,
          style: kRegularStyle.copyWith(
              color: Colors.white, fontSize: kRegularSize + 4),
        ),
        Text(
          subText,
          style: kRegularStyle.copyWith(
            color: Colors.white.withAlpha(100),
            fontSize: kRegularSize - 2,
          ),
        )
      ],
    );
  }
}
