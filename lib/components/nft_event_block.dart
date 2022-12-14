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
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topPadding != null ? SizedBox(height: topPadding!) : Container(),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 220,
            maxWidth: size.width - 40,
          ),
          child: Image.asset(
            assetPath ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: BoxDecoration(
                color: kSlightlyDarkBlue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        // Container(
        //   // height: 200,
        //   // width: 350,
        //   constraints: BoxConstraints(
        //     maxWidth: size.width - 40,
        //     maxHeight: 220,
        //   ),
        //   decoration: BoxDecoration(
        //     color: kSlightlyDarkBlue,
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        const SizedBox(height: 20),
        Text(
          eventTitle,
          style: kRegularStyle.copyWith(
            color: Colors.white,
          ),
        ),
        date != null ? const SizedBox(height: 5) : Container(),
        date != null
            ? Text(
                date!,
                style: kRegularStyle.copyWith(
                  color: Colors.white.withAlpha(100),
                ),
              )
            : Container(),
        isLast ? const SizedBox(height: 40) : Container(),
      ],
    );
  }
}
