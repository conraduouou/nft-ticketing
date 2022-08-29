import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';

class NFTBottomSheet extends StatelessWidget {
  const NFTBottomSheet({
    Key? key,
  }) : super(key: key);

  static void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      barrierColor: kDialogBarrierColor,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return const NFTBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _NFTBottomSheetSettings(
      bottomSheetBody: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Ticket',
                  style: kSemiBoldStyle.copyWith(
                    color: Colors.white,
                    fontSize: kRegularSize + 2,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                  child: Icon(
                    Icons.close,
                    color: Colors.white.withAlpha(100),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const _NFTBottomSheetCard(
              mainText: 'General Admission',
              subText: 'US \$50.00',
              isSelected: true,
            ),
            const SizedBox(height: 20),
            const _NFTBottomSheetCard(
              mainText: 'Premium',
              subText: 'US \$70.00',
              isSelected: false,
            ),
            const SizedBox(height: 20),
            const _NFTBottomSheetCard(
              mainText: 'VIP',
              subText: 'US \$100.00',
              isSelected: false,
            ),
            const SizedBox(height: 50),
            const NFTButton(
              text: 'Select',
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _NFTBottomSheetSettings extends StatelessWidget {
  const _NFTBottomSheetSettings({
    Key? key,
    required this.bottomSheetBody,
  }) : super(key: key);

  final Widget bottomSheetBody;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: size.height / 7.25 * 3 + 270,
        decoration: const BoxDecoration(
          color: kDarkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: bottomSheetBody,
      ),
    );
  }
}

class _NFTBottomSheetCard extends StatelessWidget {
  const _NFTBottomSheetCard({
    Key? key,
    required this.mainText,
    required this.subText,
    required this.isSelected,
  }) : super(key: key);

  final String mainText;
  final String subText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 7.25,
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kSlightlyDarkBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mainText,
                style: kRegularStyle.copyWith(
                  fontSize: kRegularSize,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subText,
                style: kRegularStyle.copyWith(
                  fontSize: kRegularSize,
                  color: Colors.white.withAlpha(100),
                ),
              )
            ],
          ),
          _NFTBottomSheetRadioButton(isSelected: isSelected),
        ],
      ),
    );
  }
}

class _NFTBottomSheetRadioButton extends StatelessWidget {
  const _NFTBottomSheetRadioButton({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor : null,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
    );
  }
}
