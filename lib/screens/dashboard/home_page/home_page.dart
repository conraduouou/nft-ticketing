import 'dart:async';

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
            const _NFTHomePageSlideshow(),
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

class _NFTHomePageSlideshow extends StatefulWidget {
  const _NFTHomePageSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  State<_NFTHomePageSlideshow> createState() => _NFTHomePageSlideshowState();
}

class _NFTHomePageSlideshowState extends State<_NFTHomePageSlideshow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int _assetIndex = 0;

  final List<String> _assetPaths = [
    'assets/homepage/image-home-heroimage@2x.png',
    'assets/homepage/img-banner-comingsoon-1@2x.png',
    'assets/homepage/img-banner-comingsoon-3@3x.png',
  ];

  void switchIndexCallback(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      await Future.delayed(const Duration(seconds: 3));
      await _controller.reverse();

      setState(() {
        _assetIndex = ++_assetIndex % _assetPaths.length;
        _controller.forward();
      });
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addStatusListener(switchIndexCallback);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(switchIndexCallback);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: size.width / 1.9,
        child: Stack(
          children: [
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                _assetPaths[_assetIndex],
                key: UniqueKey(),
                width: size.width - 40,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (int i = 0; i < _assetPaths.length; i++)
                      Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color:
                              _assetIndex == i ? kPrimaryColor : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
