import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTEventMiniBlock extends StatelessWidget {
  const NFTEventMiniBlock({
    Key? key,
    required this.eventTitle,
    this.date,
    this.assetPath,
    this.hasBottomPadding = true,
  }) : super(key: key);

  final String eventTitle;
  final String? assetPath;
  final String? date;
  final bool hasBottomPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          assetPath ?? '',
          height: 150,
          width: 170,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Container(
                height: 150,
                width: 170,
                decoration: BoxDecoration(
                    color: kSlightlyDarkBlue,
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          },
        ),
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
                  color: kSecondaryColor,
                ),
              )
            : Container(),
        hasBottomPadding ? const SizedBox(height: 40) : Container(),
      ],
    );
  }
}
