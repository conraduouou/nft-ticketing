import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTEventBlock extends StatelessWidget {
  const NFTEventBlock({
    Key? key,
    required this.eventTitle,
    this.topPadding,
    this.isLast = false,
    this.assetPath,
    this.date,
  }) : super(key: key);

  final bool isLast;
  final double? topPadding;
  final String eventTitle;
  final String? assetPath;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topPadding != null ? SizedBox(height: topPadding!) : Container(),
        /*  Uncomment in prod
        Image.asset(
          assetPath ?? '',
          height: 200,
          width: 350,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>  Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: kSlightlyDarkBlue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        */
        Container(
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            color: kSlightlyDarkBlue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          eventTitle,
          style: kRegularStyle.copyWith(
            color: Colors.white,
          ),
        ),
        isLast ? const SizedBox(height: 40) : Container(),
      ],
    );
  }
}
