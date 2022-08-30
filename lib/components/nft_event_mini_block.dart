import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTEventMiniBlock extends StatelessWidget {
  const NFTEventMiniBlock({
    Key? key,
    required this.eventTitle,
    this.constraints,
    this.date,
    this.assetPath,
    this.hasBottomPadding = true,
    this.onTap,
  }) : super(key: key);

  final String eventTitle;
  final String? assetPath;
  final String? date;
  final bool hasBottomPadding;
  final BoxConstraints? constraints;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: constraints ?? const BoxConstraints(),
            child: Image.asset(
              assetPath ?? '',
              // height: 150,
              // width: 170,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kSlightlyDarkBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
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
      ),
    );
  }
}
