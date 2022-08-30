import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_mini_events_slide_section.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/nft_event_details.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/event_details/event_details.dart';
import 'package:nft_ticketing/screens/dashboard/events_view/events_view.dart';
import 'package:nft_ticketing/screens/dashboard/search_page/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/home';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        NFTSliverBar(
          heroTag: SearchType.home,
          searchOnTap: () => Navigator.of(context).pushNamed(
            SearchPage.id,
            arguments: SearchType.home,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/homepage/image-home-heroimage@2x.png',
                width: size.width - 40,
                // height: 200,
              ),
            ),
            const _NFTHomeDiv(),
            NFTMiniEventsSlideSection(
              sectionTitle: 'Happening Now',
              onViewTap: () =>
                  Navigator.pushNamed(context, EventsViewPage.happeningNowId),
              blockOnTap: (index) =>
                  // dynamically set event to view in the future
                  Navigator.of(context).pushNamed(EventDetailsPage.id),
              listOfEvents: () {
                final toReturn = <NFTEventDetails>[];
                final list = <String>[
                  'Innings Festival',
                  'Lost Lands',
                  'T-Rex',
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
              hasBottomPadding: true,
              sectionTitle: 'Coming Soon',
              listHeight: size.width / 1.4,
              onViewTap: () {
                Navigator.pushNamed(context, EventsViewPage.comingSoonId);
              },
              blockOnTap: (index) =>
                  // dynamically set event to view in the future
                  Navigator.of(context).pushNamed(EventDetailsPage.id),
              listOfEvents: () {
                final toReturn = <NFTEventDetails>[];
                final list = <String>[
                  'High Water',
                  'Sunset',
                  'T-Rex',
                ];

                final dates = <String>[
                  'April 23, 2022',
                  'May 27, 2022',
                  'August 4, 2022',
                ];

                for (int i = 0; i < 3; i++) {
                  toReturn.add(NFTEventDetails(
                    assetPath:
                        'assets/homepage/img-${i != 2 ? 'comingsoon' : 'happeningnow'}'
                        '-${i + 1}@2x.png',
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
