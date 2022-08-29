import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';

class NFTDialog extends StatelessWidget {
  const NFTDialog({
    Key? key,
    this.onPressed,
    this.headingText,
    this.subText,
    this.buttonText,
    this.subTextColor,
    this.buttonPadding,
    this.height = 250,
    this.width = 350,
    this.showCancel = false,
    this.cancelPadding,
    this.headingSize = kLargeSize - 2,
  }) : super(key: key);

  /// The operation to be done upon pressing the button in this `Dialog`.
  final VoidCallback? onPressed;

  final String? headingText;
  final String? subText;
  final String? buttonText;
  final Color? subTextColor;
  final EdgeInsets? buttonPadding;

  final double height;
  final double width;
  final double headingSize;
  final bool showCancel;
  final EdgeInsets? cancelPadding;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: kSlightlyDarkBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                headingText ?? 'Success!',
                style: kBoldStyle.copyWith(
                  fontSize: headingSize,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width - 60),
                child: Text(
                  subText ?? 'You have created your new password.',
                  textAlign: TextAlign.center,
                  style: kRegularStyle.copyWith(
                    color: subTextColor ?? Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              NFTButton(
                text: buttonText ?? 'Go to sign in',
                padding:
                    buttonPadding ?? const EdgeInsets.fromLTRB(20, 12, 20, 16),
                onPressed: onPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
              showCancel ? const SizedBox(height: 20) : Container(),
              showCancel
                  ? NFTButton(
                      text: 'Cancel',
                      color: kSecondaryColor,
                      padding: cancelPadding ??
                          buttonPadding ??
                          const EdgeInsets.fromLTRB(20, 12, 20, 16),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
