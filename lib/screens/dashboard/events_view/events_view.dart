import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_event_block.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class EventsViewPage extends StatelessWidget {
  const EventsViewPage({
    Key? key,
    this.title = 'Happening Now',
  }) : super(key: key);

  final String title;

  static const String happeningNowId = '${DashboardContainer.id}/happening-now';
  static const String comingSoonId = '${DashboardContainer.id}/coming-soon';
  static const String recommendedId = '${DashboardContainer.id}/recommended';

  @override
  Widget build(BuildContext context) {
    final happeningNowStrings = <String>[
      'Innings Festival',
      'Lost Lands',
      'High Water',
    ];

    final comingSoonStrings = <String>[
      'High Water',
      'Sunset',
      'iHeart Radio Music Festival'
    ];

    final happeningNow = title.toLowerCase().contains('happening');

    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: NFTAppBar(
        title: title,
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
              assetPath: happeningNow
                  ? i != 2
                      ? 'assets/homepage/img-banner-happeningnow-${i + 2}@2x.png'
                      : 'assets/homepage/img-banner-comingsoon-1@2x.png'
                  : 'assets/homepage/img-banner-comingsoon-${i + 1}@2x.png',
              eventTitle:
                  happeningNow ? happeningNowStrings[i] : comingSoonStrings[i],
              date: happeningNow ? null : 'April 23, 2022',
              topPadding: i == 0 ? 30 : null,
              isLast: i == 2,
            );
          },
        ),
      ),
    );
  }
}
