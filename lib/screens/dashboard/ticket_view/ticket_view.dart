import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_add_to_calendar.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_dialog.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  static const id = '${AccountPage.id}/view-ticket';

  final String eventTitle;
  final String eventDate;

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: kDialogBarrierColor,
      builder: (context) => NFTDialog(
        height: 400,
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
        subText: '"$eventTitle, $eventDate"\n\n'
            'This event will be added to your phone\'s calendar.',
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 14,
        ),
      ),
    );
  }

  void _downloadOnPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text('Ticket saved'),
        duration: const Duration(milliseconds: 1500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(title: 'My Tickets'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            _NFTTicketViewDetails(
              eventDate: eventDate,
              eventTitle: eventTitle,
            ),
            const SizedBox(height: 30),
            NFTButton(
              onPressed: () => _downloadOnPressed(context),
              text: 'Download Ticket',
              padding: const EdgeInsets.symmetric(vertical: 20),
              fontSize: kRegularSize + 1,
            ),
            const SizedBox(height: 30),
            NFTAddToCalendar(onTap: () => _showDialog(context)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _NFTTicketViewDetails extends StatelessWidget {
  const _NFTTicketViewDetails({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  final String eventTitle;
  final String eventDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/ticket-bg.svg',
        ),
        const Positioned(
          top: 20,
          child: _NFTTicketQRCode(),
        ),
        Positioned(
          bottom: 43,
          left: 35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Juan Dela Cruz',
                style: kSemiBoldStyle.copyWith(
                  color: kDarkBlue,
                  fontSize: kLargeSize - 3,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  _NFTTicketViewDetailsBlock(
                    blockName: 'Order Number',
                    blockInfo: ['#2300534'],
                  ),
                  SizedBox(width: 30),
                  _NFTTicketViewDetailsBlock(
                    blockName: 'Ticket Price',
                    blockInfo: ['US \$52.50'],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _NFTTicketViewDetailsBlock(
                blockName: 'Event',
                blockInfo: [eventTitle],
              ),
              const SizedBox(height: 20),
              _NFTTicketViewDetailsBlock(
                blockName: 'Date and Time',
                blockInfo: [eventDate, '2:00 PM - 5:00 PM'],
              ),
              const SizedBox(height: 20),
              const _NFTTicketViewDetailsBlock(
                blockName: 'Location',
                blockInfo: ['Tampa, FL', 'Raymond James Stadium Grounds'],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _NFTTicketViewDetailsBlock extends StatelessWidget {
  const _NFTTicketViewDetailsBlock({
    Key? key,
    required this.blockName,
    required this.blockInfo,
  }) : super(key: key);

  final String blockName;
  final List<String> blockInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          blockName,
          style: kSemiBoldStyle.copyWith(
            color: kGrayishBlue,
            fontSize: kRegularSize - 4,
          ),
        ),
        const SizedBox(height: 5),
        for (int i = 0; i < blockInfo.length; i++)
          Column(
            children: [
              Text(
                blockInfo[i],
                style: kSemiBoldStyle.copyWith(
                  color: kDarkBlue,
                  fontSize: kRegularSize - 2,
                ),
              ),
              i != blockInfo.length - 1
                  ? const SizedBox(height: 5)
                  : Container()
            ],
          ),
      ],
    );
  }
}

class _NFTTicketQRCode extends StatelessWidget {
  const _NFTTicketQRCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: kGrayishBlue,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              'QR Code here',
              textAlign: TextAlign.center,
              style: kRegularStyle.copyWith(
                color: kGrayishBlue,
                fontSize: kRegularSize - 8,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Show the QR code at the event',
          style: kRegularStyle.copyWith(
            fontSize: kRegularSize - 6,
            color: kGrayishBlue,
          ),
        ),
      ],
    );
  }
}
