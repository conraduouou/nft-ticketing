import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/community';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkBlue,
    );
  }
}
