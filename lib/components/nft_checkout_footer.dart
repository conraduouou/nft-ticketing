import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';

class NFTCheckoutFooter extends StatelessWidget {
  const NFTCheckoutFooter({
    Key? key,
    required this.buttonText,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: kSlightlyDarkBlue, width: 1),
        ),
      ),
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: kRegularStyle.copyWith(
                    fontSize: kRegularSize + 1,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'US \$50.00',
                  style: kRegularStyle.copyWith(
                    fontSize: kRegularSize + 1,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            NFTButton(
              text: buttonText,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
