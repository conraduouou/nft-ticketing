import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                i == 0 ? const SizedBox(height: 30) : Container(),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: kSlightlyDarkBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Innings Festival',
                  style: kRegularStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                i == 2 ? const SizedBox(height: 40) : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
