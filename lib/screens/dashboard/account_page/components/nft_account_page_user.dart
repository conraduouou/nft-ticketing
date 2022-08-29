import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAccountPageUser extends StatelessWidget {
  const NFTAccountPageUser({
    Key? key,
    required this.name,
    required this.email,
    this.isSelf = true,
  }) : super(key: key);

  final String name, email;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              !isSelf ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            isSelf ? const Spacer(flex: 18) : Container(),
            Text(
              name,
              style: kSemiBoldStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize + 2,
              ),
            ),
            isSelf ? const SizedBox(width: 10) : Container(),
            isSelf
                ? SvgPicture.asset(
                    'assets/icons/ic-edit.svg',
                    color: kPrimaryColor,
                    height: 20,
                  )
                : Container(),
            isSelf ? const Spacer(flex: 15) : Container(),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          email,
          style: kRegularStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize - 2,
          ),
        ),
      ],
    );
  }
}
