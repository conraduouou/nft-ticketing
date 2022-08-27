import 'package:flutter/material.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/event_details/event_details.dart';
import 'package:nft_ticketing/screens/dashboard/events_view/events_view.dart';
import 'package:nft_ticketing/screens/dashboard/notification_details_page/notification_details_page.dart';
import 'package:nft_ticketing/screens/dashboard/notification_page/notification_page.dart';
import 'package:nft_ticketing/screens/dashboard/search_page/search_page.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view/ticket_view.dart';
import 'package:nft_ticketing/screens/dashboard/transaction_details/transaction_details.dart';
import 'package:nft_ticketing/screens/dashboard/transaction_history/transaction_history.dart';
import 'package:nft_ticketing/screens/landing/create_page/create_page.dart';
import 'package:nft_ticketing/screens/landing/enter_code_page/enter_code_page.dart';
import 'package:nft_ticketing/screens/landing/forgot_password_page/forgot_password_page.dart';
import 'package:nft_ticketing/screens/landing/landing_page/landing_page.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';
import 'package:nft_ticketing/screens/landing/new_password_page/new_password_page.dart';

class RoutesHandler {
  final Map<String, WidgetBuilder> routes = {
    CreatePage.id: (context) => const CreatePage(),
    EventsViewPage.comingSoonId: (context) =>
        const EventsViewPage(happeningNow: false),
    EventsViewPage.happeningNowId: (context) =>
        const EventsViewPage(happeningNow: true),
    ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
    LandingPage.id: (context) => const LandingPage(),
    LoginPage.id: (context) => const LoginPage(),
    NewPasswordPage.id: (context) => const NewPasswordPage(),
    NotificationPage.id: (context) => const NotificationPage(),
    TransactionHistoryPage.id: (context) => const TransactionHistoryPage(),
    SearchPage.id: (context) => const SearchPage(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashboardContainer.id:
        final toView = settings.arguments as String?;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DashboardContainer(toView: toView),
        );
      case EnterCodePage.id:
        final email = settings.arguments as String;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => EnterCodePage(email: email),
        );
      case EventDetailsPage.id:
        // handle viewing of different events here

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const EventDetailsPage(),
        );
      case NotificationDetailsPage.id:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => NotificationDetailsPage(
            notification: args['notif'],
            provider: args['provider'],
          ),
        );

      case TicketView.id:
        final args = settings.arguments as Map<String, String>;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => TicketView(
            eventTitle: args['eventTitle']!,
            eventDate: args['eventDate']!,
          ),
        );
      case TransactionDetailsPage.id:
        final ticketNo = settings.arguments as int;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => TransactionDetailsPage(ticketNo: ticketNo),
        );
    }

    return null;
  }
}
