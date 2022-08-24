import 'package:flutter/material.dart';
import 'package:nft_ticketing/routes.dart';
import 'package:nft_ticketing/screens/landing/landing_page/landing_page.dart';

class NFTTicketingApp extends StatelessWidget {
  NFTTicketingApp({Key? key}) : super(key: key);

  final routesHandler = RoutesHandler();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Ticketing',
      routes: routesHandler.routes,
      initialRoute: LandingPage.id,
      onGenerateRoute: routesHandler.onGenerateRoute,
    );
  }
}
