import 'package:flutter/material.dart';
import 'package:nft_ticketing/screens/home/dashboard_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/home';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView();
  }
}
