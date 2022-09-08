import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view_page/ticket_view_page.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({
    super.key,
    required this.eventTitle,
  });

  static const String id = '${TicketViewPage.id}/qr-code';

  final String eventTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NFTAppBar(title: eventTitle),
      backgroundColor: kDarkBlue,
    );
  }
}
