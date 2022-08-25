import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_mini_events_slide_section.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/nft_event_details.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/events_view/events_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/home';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NFTSliverBar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/homepage/image-home-heroimage@2x.png',
                width: 350,
                height: 200,
              ),
            ),
            const _NFTHomeDiv(),
            NFTMiniEventsSlideSection(
              sectionTitle: 'Happening Now',
              onViewTap: () =>
                  Navigator.pushNamed(context, EventsViewPage.happeningNowId),
              listOfEvents: () {
                final toReturn = <NFTEventDetails>[];
                final list = <String>[
                  'Innings Festival',
                  'Lost Lands',
                  'Something',
                ];

                for (int i = 0; i < 3; i++) {
                  toReturn.add(NFTEventDetails(
                    assetPath:
                        'assets/homepage/img-happeningnow-${i + 1}@2x.png',
                    eventTitle: list[i],
                  ));
                }

                return toReturn;
              }(),
            ),
            const _NFTHomeDiv(),
            NFTMiniEventsSlideSection(
              sectionTitle: 'Coming Soon',
              listHeight: 260,
              onViewTap: () {
                Navigator.pushNamed(context, EventsViewPage.comingSoonId);
              },
              listOfEvents: () {
                final toReturn = <NFTEventDetails>[];
                final list = <String>[
                  'High Water',
                  'Sunset',
                  'Something',
                ];

                final dates = <String>[
                  'April 23, 2022',
                  'May 27, 2022',
                  'August 4, 2022',
                ];

                for (int i = 0; i < 3; i++) {
                  toReturn.add(NFTEventDetails(
                    assetPath: 'assets/homepage/img-comingsoon-${i + 1}@2x.png',
                    eventTitle: list[i],
                    eventDate: dates[i],
                  ));
                }

                return toReturn;
              }(),
            ),
          ]),
        ),
      ],
    );
  }
}

class _NFTHomeDiv extends StatelessWidget {
  const _NFTHomeDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        color: kSlightlyDarkBlue,
        height: 60,
      ),
    );
  }
}
