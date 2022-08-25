import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/home';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NFTSliverBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
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
              const _NFTHomeSectionWrapper(
                sectionTitle: 'Happening Now',
                child: _NFTHomeHappeningNow(),
              ),
              const _NFTHomeDiv(),
              const _NFTHomeSectionWrapper(
                sectionTitle: 'Coming Soon',
                child: _NFTHomeComingSoon(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NFTHomeSectionWrapper extends StatelessWidget {
  const _NFTHomeSectionWrapper(
      {Key? key, required this.sectionTitle, required this.child})
      : super(key: key);

  final String sectionTitle;
  final Widget child;

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
              Text(
                'View all (20)',
                style: kRegularStyle.copyWith(color: kPrimaryColor),
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
                Image.asset(
                  'assets/homepage/img-happeningnow-${i + 1}@2x.png',
                  height: 150,
                  width: 170,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Container(
                        height: 150,
                        width: 170,
                        decoration: BoxDecoration(
                            color: kSlightlyDarkBlue,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  list[i],
                  style: kRegularStyle.copyWith(
                    color: Colors.white,
                  ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/homepage/img-comingsoon-${i + 1}@2x.png',
                  height: 150,
                  width: 170,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Container(
                        height: 150,
                        width: 170,
                        decoration: BoxDecoration(
                            color: kSlightlyDarkBlue,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  list[i],
                  style: kRegularStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  dates[i],
                  style: kRegularStyle.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
                const SizedBox(height: 40),
              ],
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
