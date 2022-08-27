import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/review_order/review_order.dart';

class NFTCheckoutFooter extends StatelessWidget {
  const NFTCheckoutFooter({
    Key? key,
    this.padding,
  }) : super(key: key);

  final EdgeInsets? padding;

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
              text: 'Buy Ticket',
              onPressed: () =>
                  Navigator.of(context).pushNamed(ReviewOrderPage.id),
            ),
          ],
        ),
      ),
    );
  }
}
