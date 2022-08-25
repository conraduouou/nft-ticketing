import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_event_mini_block.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/event_details/event_details.dart';
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
            _NFTHomeSectionWrapper(
              sectionTitle: 'Happening Now',
              child: const _NFTHomeHappeningNow(),
              onViewTap: () {
                Navigator.pushNamed(context, EventsViewPage.happeningNowId);
              },
            ),
            const _NFTHomeDiv(),
            _NFTHomeSectionWrapper(
              sectionTitle: 'Coming Soon',
              child: const _NFTHomeComingSoon(),
              onViewTap: () {
                Navigator.pushNamed(context, EventsViewPage.comingSoonId);
              },
            ),
          ]),
        ),
      ],
    );
  }
}

class _NFTHomeSectionWrapper extends StatelessWidget {
  const _NFTHomeSectionWrapper({
    Key? key,
    required this.sectionTitle,
    required this.child,
    this.onViewTap,
  }) : super(key: key);

  final String sectionTitle;
  final Widget child;
  final VoidCallback? onViewTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: kSemiBoldStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: onViewTap,
                child: Text(
                  'View all (20)',
                  style: kRegularStyle.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        child,
      ],
    );
  }
}

class _NFTHomeHappeningNow extends StatelessWidget {
  const _NFTHomeHappeningNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = <String>[
      'Innings Festival',
      'Lost Lands',
      'Something',
    ];

    return SizedBox(
      height: 195,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, i) => const SizedBox(width: 10),
        itemBuilder: (ctx, i) {
          return Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? 20 : 0,
              right: i == 2 ? 20 : 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NFTEventMiniBlock(
                  eventTitle: list[i],
                  assetPath: 'assets/homepage/img-happeningnow-${i + 1}@2x.png',
                  hasBottomPadding: false,
                  onTap: () {
                    Navigator.of(context).pushNamed(EventDetailsPage.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NFTHomeComingSoon extends StatelessWidget {
  const _NFTHomeComingSoon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, i) => const SizedBox(width: 10),
        itemBuilder: (ctx, i) {
          return Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? 20 : 0,
              right: i == 2 ? 20 : 0,
            ),
            child: NFTEventMiniBlock(
              eventTitle: list[i],
              date: dates[i],
              assetPath: 'assets/homepage/img-comingsoon-${i + 1}@2x.png',
            ),
          );
        },
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
