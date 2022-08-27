import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAddToCalendar extends StatelessWidget {
  const NFTAddToCalendar({
    Key? key,
    this.onTap,
    this.fontSize,
  }) : super(key: key);

  final VoidCallback? onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/ic-calendar.svg',
            color: kPrimaryColor,
          ),
          const SizedBox(width: 10),
          Text(
            'Add to calendar',
            style: kRegularStyle.copyWith(
              color: kPrimaryColor,
              fontSize: fontSize,
            ),
          )
        ],
      ),
    );
  }
}
