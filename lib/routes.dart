import 'package:flutter/material.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/landing/create_page/create_page.dart';
import 'package:nft_ticketing/screens/landing/enter_code_page/enter_code_page.dart';
import 'package:nft_ticketing/screens/landing/forgot_password_page/forgot_password_page.dart';
import 'package:nft_ticketing/screens/landing/landing_page/landing_page.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';
import 'package:nft_ticketing/screens/landing/new_password_page/new_password_page.dart';

class RoutesHandler {
  final Map<String, WidgetBuilder> routes = {
    LandingPage.id: (context) => const LandingPage(),
    CreatePage.id: (context) => const CreatePage(),
    LoginPage.id: (context) => const LoginPage(),
    ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
    NewPasswordPage.id: (context) => const NewPasswordPage(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EnterCodePage.id:
        final email = settings.arguments as String;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => EnterCodePage(email: email),
        );
      case DashboardContainer.id:
        final toView = settings.arguments as String?;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DashboardContainer(toView: toView),
        );
    }

    return null;
  }
}
