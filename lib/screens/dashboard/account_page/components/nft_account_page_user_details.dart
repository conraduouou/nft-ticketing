import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_vertical_div.dart';

class NFTAccountPageUserDetails extends StatelessWidget {
  const NFTAccountPageUserDetails({
    Key? key,
    required this.posts,
    required this.following,
    required this.followers,
  }) : super(key: key);

  final num posts;
  final num following;
  final num followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: NumberFormat.compact().format(posts),
            subText: 'Posts',
          ),
        ),
        const NFTAccountPageVerticalDiv(),
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: NumberFormat.compact().format(following),
            subText: 'Following',
          ),
        ),
        const NFTAccountPageVerticalDiv(),
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: NumberFormat.compact().format(followers),
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
