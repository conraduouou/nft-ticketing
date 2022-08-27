import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_checkout_footer.dart';
import 'package:nft_ticketing/components/nft_checkout_title.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/checkout_page/checkout_page.dart';
import 'package:nft_ticketing/screens/dashboard/event_details/event_details.dart';

class ReviewOrderPage extends StatelessWidget {
  const ReviewOrderPage({Key? key}) : super(key: key);

  static const id = '${EventDetailsPage.id}/order-ticket';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 40),
                      const NFTCheckoutTitle(
                        title: 'Review order',
                        eventTitle: 'Innings Festival',
                        eventDate: 'March 19, 2022 - March 20, 2022',
                      ),
                      const Divider(
                        color: kSlightlyDarkBlue,
                        thickness: 1,
                        height: 60,
                      ),
                      const _NFTReviewOrderQuantitySetting(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          NFTCheckoutFooter(
            buttonText: 'Check Out',
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            onPressed: () => Navigator.of(context).pushNamed(CheckoutPage.id),
          ),
        ],
      ),
    );
  }
}

class _NFTReviewOrderQuantitySetting extends StatelessWidget {
  const _NFTReviewOrderQuantitySetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Admission',
              style: kSemiBoldStyle.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$50.00 ',
                    style: kSemiBoldStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '+\$2.50 fee',
                    style: kRegularStyle.copyWith(
                      color: Colors.white.withAlpha(100),
                      fontSize: kRegularSize - 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const NFTField(
          isBordered: true,
          color: kDarkBlue,
          initialText: '1',
          width: 60,
          height: 50,
          showSuffix: false,
          isDigitsOnly: true,
        )
      ],
    );
  }
}
