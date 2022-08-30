import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_add_to_calendar.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_dialog.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/account_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';
import 'package:nft_ticketing/screens/dashboard/checkout_page/checkout_page.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view_page/ticket_view_page.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({Key? key}) : super(key: key);

  static const id = '${CheckoutPage.id}/complete';

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: kDialogBarrierColor,
      builder: (context) => NFTDialog(
        // height: 400,
        showCancel: true,
        headingText: 'Add to calendar?',
        headingSize: kLargeSize - 8,
        buttonText: 'Allow',
        onPressed: () {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: const Text('Added to calendar'),
              duration: const Duration(milliseconds: 1500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        subText: '"Innings Festival, March 19 & 20, 2022 "\n\n'
            'This event will be added to your phone\'s calendar.',
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 70,
            right: 20,
            child: NFTBackButton(
              isClose: true,
              height: 40,
              width: 40,
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                DashboardContainer.id,
                (_) => false,
                // arguments: HomePage.id,
              ),
            ),
          ),
          _NFTOrderCompletePageMessage(addOnTap: () => _showDialog(context)),
          Positioned(
            left: 20,
            bottom: 50,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width - 40,
              ),
              child: NFTButton(
                text: 'View ticket',
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    DashboardContainer.id,
                    (_) => false,
                    arguments: AccountPage.id,
                  );

                  Navigator.of(context).pushNamed(
                    TicketViewPage.id,
                    arguments: {
                      'eventTitle': 'Innings Festival',
                      'eventDate': 'March 19 & 20, 2022',
                      'dateView': TicketDate.upcoming,
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NFTOrderCompletePageMessage extends StatelessWidget {
  const _NFTOrderCompletePageMessage({
    Key? key,
    this.addOnTap,
  }) : super(key: key);

  final VoidCallback? addOnTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/ic-check-circle.svg',
            color: const Color(0xff39F180),
          ),
          const SizedBox(height: 25),
          Text(
            'Order Complete!',
            style: kSemiBoldStyle.copyWith(
              color: Colors.white,
              fontSize: kLargeSize - 6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'See you at the event!',
            style: kRegularStyle.copyWith(
              color: kGrayishBlue,
            ),
          ),
          const SizedBox(height: 25),
          NFTAddToCalendar(
            fontSize: kRegularSize - 2,
            onTap: addOnTap,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
