import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/account_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';

class TicketViewPage extends StatelessWidget {
  const TicketViewPage({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
    this.dateView = TicketDate.upcoming,
  }) : super(key: key);

  static const id = '${AccountPage.id}/view-ticket';

  final String eventTitle;
  final String eventDate;

  final TicketDate dateView;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(title: 'My Tickets'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 523,
                  maxWidth: size.width - 40,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: CustomPaint(
                  painter: _NFTTicketPainter(verticalPadding: 30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _NFTTicketViewPageContent(
                      eventTitle: eventTitle,
                      eventDate: eventDate,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            dateView == TicketDate.upcoming
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: NFTButton(
                      onPressed: () => _downloadOnPressed(context),
                      text: 'Generate QR',
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      fontSize: kRegularSize + 1,
                    ),
                  )
                : Container(),
            /*
            dateView == TicketDate.upcoming
                ? const SizedBox(height: 30)
                : Container(),
            dateView == TicketDate.upcoming
                ? NFTAddToCalendar(onTap: () => _showDialog(context))
                : Container(),
            const SizedBox(height: 40),
            */
          ],
        ),
      ),
    );
  }

  /*
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
        subText: '"$eventTitle, $eventDate"\n\n'
            'This event will be added to your phone\'s calendar.',
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 14,
        ),
      ),
    );
  }
  */
}

class _NFTTicketViewPageContent extends StatelessWidget {
  const _NFTTicketViewPageContent({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  final String eventTitle;
  final String eventDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
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
        const SizedBox(height: 20),
        const _NFTTicketViewDetailsBlock(
          blockName: 'Transaction',
          textColor: Color(0xFF1A5EE0),
          blockInfo: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing '
                'elit. Nulla vitae laoreet velit.',
          ],
        ),
      ],
    );
  }
}

class _NFTTicketPainter extends CustomPainter {
  _NFTTicketPainter({
    required this.verticalPadding,
  });

  final double verticalPadding;

  @override
  void paint(Canvas canvas, Size size) {
    const dashLength = 3.0; // the length of a single dash
    const gap = 3.0; // gap between lines
    double currentX = 0.0; // the current X position of the dash

    const circleRadius = 6.0;

    final topY = verticalPadding; // the Y position of the first line
    final bottomY =
        size.height - verticalPadding; // the Y position of the second line

    final circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = kDarkBlue;

    final linePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = kSecondaryColor.withAlpha(120);

    // draw the lines
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 30),
        Offset(currentX + dashLength, 30),
        linePaint,
      );

      canvas.drawLine(
        Offset(currentX, bottomY),
        Offset(currentX + dashLength, bottomY),
        linePaint,
      );

      currentX += dashLength + gap;
    }

    // draw the circles
    canvas.drawCircle(Offset(0, topY), circleRadius, circlePaint);
    canvas.drawCircle(Offset(size.width, topY), circleRadius, circlePaint);

    canvas.drawCircle(Offset(0, bottomY), circleRadius, circlePaint);
    canvas.drawCircle(Offset(size.width, bottomY), circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NFTTicketViewDetailsBlock extends StatelessWidget {
  const _NFTTicketViewDetailsBlock({
    Key? key,
    required this.blockName,
    required this.blockInfo,
    this.textColor,
  }) : super(key: key);

  final String blockName;
  final List<String> blockInfo;
  final Color? textColor;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blockInfo[i],
                style: kSemiBoldStyle.copyWith(
                  color: textColor ?? kDarkBlue,
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

/*
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
          left: 20,
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
*/
