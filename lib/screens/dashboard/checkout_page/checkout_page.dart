import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_account_information.dart';
import 'package:nft_ticketing/components/nft_checkout_footer.dart';
import 'package:nft_ticketing/components/nft_checkout_title.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/order_complete_page/order_complete_page.dart';
import 'package:nft_ticketing/screens/dashboard/review_order/review_order.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  static const id = '${ReviewOrderPage.id}/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 40),
                    const NFTCheckoutTitle(
                      title: 'Checkout',
                      eventTitle: 'Innings Festival',
                      eventDate: 'March 19, 2022 - March 20, 2022',
                    ),
                    const _NFTCheckoutPageDiv(),
                    const _NFTCheckoutPageQuantityBlock(),
                    const _NFTCheckoutPageDiv(),
                    const NFTAccountInformation(
                      headingText: 'Contact Information',
                      showPasswordField: false,
                    ),
                    const _NFTCheckoutPageDiv(),
                    const _NFTCheckoutPagePaymentBlock(),
                    const _NFTCheckoutPageDiv(),
                    const _NFTCheckoutPageEmailBlock(),
                    const SizedBox(height: 40),
                  ]),
                )
              ]),
            ),
          ),
          NFTCheckoutFooter(
            buttonText: 'Place Order',
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(OrderCompletePage.id, (_) => false),
          ),
        ],
      ),
    );
  }
}

class _NFTCheckoutPageEmailBlock extends StatelessWidget {
  const _NFTCheckoutPageEmailBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Receipt',
          style: kSemiBoldStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize + 2,
          ),
        ),
        const SizedBox(height: 30),
        const NFTField(initialText: 'juandelacruz@gmail.com')
      ],
    );
  }
}

class _NFTCheckoutPagePaymentBlock extends StatelessWidget {
  const _NFTCheckoutPagePaymentBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: kSemiBoldStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize + 2,
          ),
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/checkout/img-creditcard@2x.png',
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Image.asset(
                    'assets/checkout/img-metamask@2x.png',
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Image.asset(
                    'assets/checkout/img-walletConnect@2x.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/checkout/img-coinbase@2x.png',
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Image.asset(
                    'assets/checkout/img-Fortmatic@2x.png',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SvgPicture.asset(
                    'assets/checkout/img-moreoptions.svg',
                    fit: BoxFit.fitWidth,
                    clipBehavior: Clip.none,

                    // height: 100, // as high as possible
                    // width: 200, // as high as possible
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _NFTCheckoutPageDiv extends StatelessWidget {
  const _NFTCheckoutPageDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kSlightlyDarkBlue,
      thickness: 1,
      height: 60,
    );
  }
}

class _NFTCheckoutPageQuantityBlock extends StatelessWidget {
  const _NFTCheckoutPageQuantityBlock({
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
        Text(
          '1x',
          style: kRegularStyle.copyWith(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
