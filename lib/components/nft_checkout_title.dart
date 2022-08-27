import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/constants.dart';

class NFTCheckoutTitle extends StatelessWidget {
  const NFTCheckoutTitle({
    Key? key,
    required this.title,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  final String title;
  final String eventTitle;
  final String eventDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _NFTTitle(title: title),
        const SizedBox(height: 10),
        Text(
          eventTitle,
          textAlign: TextAlign.center,
          style: kSemiBoldStyle.copyWith(
            color: kPrimaryColor,
            fontSize: kRegularSize + 2,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/ic-calendar.svg'),
            const SizedBox(width: 10),
            Text(
              eventDate,
              style: kRegularStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize - 2,
              ),
            )
          ],
        ),
      ],
    );
  }
}

/// A pseudo-appbar that is scrolled alongside the body of a page, containing a
/// back button and a title.
///
/// Does not contain the spacing above the screen, and expects the developer to
/// manually supply a SizedBox above it.
class _NFTTitle extends StatelessWidget {
  const _NFTTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            title,
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
