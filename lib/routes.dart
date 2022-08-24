import 'package:flutter/material.dart';
import 'package:nft_ticketing/screens/landing/landing_page/landing_page.dart';

class RoutesHandler {
  final Map<String, WidgetBuilder> routes = {
    LandingPage.id: (context) => const LandingPage(
          title: 'huh',
        ),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    }

    return null;
  }
}
