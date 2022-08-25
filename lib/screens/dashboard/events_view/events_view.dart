import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_event_block.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class EventsViewPage extends StatelessWidget {
  const EventsViewPage({
    Key? key,
    this.happeningNow = true,
  }) : super(key: key);

  final bool happeningNow;

  static const String happeningNowId = '${DashboardContainer.id}/happening-now';
  static const String comingSoonId = '${DashboardContainer.id}/coming-soon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: NFTAppBar(
        title: happeningNow ? 'Happening Now' : 'Coming Soon',
        showDivider: true,
        fontSize: kRegularSize + 2,
        height: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(height: 30),
          itemBuilder: (ctx, i) {
            return NFTEventBlock(
              eventTitle: 'Innings Festival',
              topPadding: i == 0 ? 30 : null,
              isLast: i == 2,
            );
          },
        ),
      ),
    );
  }
}
