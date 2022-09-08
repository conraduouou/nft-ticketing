import 'package:flutter/material.dart';
import 'package:nft_ticketing/models/core/user.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';
import 'package:nft_ticketing/screens/dashboard/account_settings/account_settings.dart';
import 'package:nft_ticketing/screens/dashboard/checkout_page/checkout_page.dart';
import 'package:nft_ticketing/screens/dashboard/create_post_page/create_post_page.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/event_details/event_details.dart';
import 'package:nft_ticketing/screens/dashboard/events_view/events_view.dart';
import 'package:nft_ticketing/screens/dashboard/notification_details_page/notification_details_page.dart';
import 'package:nft_ticketing/screens/dashboard/notification_page/notification_page.dart';
import 'package:nft_ticketing/screens/dashboard/order_complete_page/order_complete_page.dart';
import 'package:nft_ticketing/screens/dashboard/review_order/review_order.dart';
import 'package:nft_ticketing/screens/dashboard/search_page/search_page.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view_page/qr_code_page.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view_page/ticket_view_page.dart';
import 'package:nft_ticketing/screens/dashboard/transaction_details/transaction_details.dart';
import 'package:nft_ticketing/screens/dashboard/transaction_history/transaction_history.dart';
import 'package:nft_ticketing/screens/dashboard/user_chat/user_chat_page.dart';
import 'package:nft_ticketing/screens/landing/connect_wallet_page/connect_wallet_page.dart';
import 'package:nft_ticketing/screens/landing/create_account_page/create_account_page.dart';
import 'package:nft_ticketing/screens/landing/enter_code_page/enter_code_page.dart';
import 'package:nft_ticketing/screens/landing/forgot_password_page/forgot_password_page.dart';
import 'package:nft_ticketing/screens/landing/import_seed_page/import_seed_page.dart';
import 'package:nft_ticketing/screens/landing/landing_page/landing_page.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';
import 'package:nft_ticketing/screens/landing/new_password_page/new_password_page.dart';

class RoutesHandler {
  final Map<String, WidgetBuilder> routes = {
    AccountSettings.id: (context) => const AccountSettings(),
    CreateAccountPage.id: (context) => const CreateAccountPage(),
    CreatePostPage.id: (context) => const CreatePostPage(),
    ConnectWalletPage.id: (context) => const ConnectWalletPage(),
    EventsViewPage.comingSoonId: (context) =>
        const EventsViewPage(happeningNow: false),
    EventsViewPage.happeningNowId: (context) =>
        const EventsViewPage(happeningNow: true),
    ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
    ImportSeedPage.id: (context) => const ImportSeedPage(),
    LandingPage.id: (context) => const LandingPage(),
    LoginPage.id: (context) => const LoginPage(),
    NotificationPage.id: (context) => const NotificationPage(),
    TransactionHistoryPage.id: (context) => const TransactionHistoryPage(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AccountPage.id:
        final user = settings.arguments as User?;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => AccountPage(userDetails: user),
        );

      case CheckoutPage.id:
        // handle checkout screen arguments here

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CheckoutPage(),
        );
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

      case NewPasswordPage.id:
        final args = settings.arguments as Map<String, bool>?;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => NewPasswordPage(
            showLeading: args?['showLeading'] ?? false,
            isUpdate: args?['isUpdate'] ?? false,
          ),
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

      case OrderCompletePage.id:
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OrderCompletePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween =
                Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                    .chain(CurveTween(curve: Curves.easeOutCubic));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case QRCodePage.id:
        final title = settings.arguments as String;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => QRCodePage(eventTitle: title),
        );

      case ReviewOrderPage.id:
        // handle event ticket details shown in review order here
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ReviewOrderPage(),
        );
      case SearchPage.id:
        final searchType = settings.arguments as SearchType;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SearchPage(searchType: searchType),
        );
      case TicketViewPage.id:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => TicketViewPage(
            eventTitle: args['eventTitle']!,
            eventDate: args['eventDate']!,
            dateView: args['dateView'],
          ),
        );
      case TransactionDetailsPage.id:
        final ticketNo = settings.arguments as int;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => TransactionDetailsPage(ticketNo: ticketNo),
        );
      case UserChatPage.id:
        final username = settings.arguments as String;

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => UserChatPage(username: username),
        );
    }

    return null;
  }
}
