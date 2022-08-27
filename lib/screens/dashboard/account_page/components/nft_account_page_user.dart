import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAccountPageUser extends StatelessWidget {
  const NFTAccountPageUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(flex: 18),
            Text(
              'Juan Dela Cruz',
              style: kSemiBoldStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize + 2,
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              'assets/icons/ic-edit.svg',
              color: kPrimaryColor,
              height: 20,
            ),
            const Spacer(flex: 15),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'juandelacruz@gmail.com',
          style: kRegularStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize - 2,
          ),
        ),
      ],
    );
  }
}
