import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/wallet';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkBlue,
    );
  }
}
