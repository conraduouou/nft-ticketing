import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view_page/ticket_view_page.dart';

// NOTE: PLACEHOLDER QR CODE IS IN PLACE IN THE CODE, unexpected
// things may happen in the case the QR code is read. Proceed with
// caution.

class QRCodePage extends StatelessWidget {
  const QRCodePage({
    super.key,
    required this.eventTitle,
  });

  static const String id = '${TicketViewPage.id}/qr-code';

  final String eventTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: NFTAppBar(title: eventTitle),
      backgroundColor: kDarkBlue,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width - 40,
                maxHeight: size.width - 40,
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(35),
                child: Image.asset(
                  'assets/sample_qr.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
