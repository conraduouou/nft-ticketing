import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_banner.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/notification_details.dart';
import 'package:nft_ticketing/providers/notification_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/notification_page/notification_page.dart';
import 'package:provider/provider.dart';

class NotificationDetailsPage extends StatelessWidget {
  const NotificationDetailsPage({
    Key? key,
    required this.provider,
    required this.notification,
  }) : super(key: key);

  static const id = '${NotificationPage.id}/details';

  final NotificationDetails notification;
  final NotificationPageProvider provider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider.value(
      value: provider,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: kDarkBlue,
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  const NFTBanner(height: 150, boxFit: BoxFit.cover),
                  _NFTNotificationDetailsHeading(title: notification.preview),
                  const _NFTNotificationDetailsDiv(),
                  const _NFTNotificationDetailsBody(),
                  SizedBox(height: size.height / 4.5),
                  _NFTNotificationDetailsActions(notification: notification),
                  const SizedBox(height: 40),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NFTNotificationDetailsActions extends StatelessWidget {
  const _NFTNotificationDetailsActions({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationDetails notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          NFTButton(text: 'View Ticket'),
          // SizedBox(height: 30),
          /**
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              context
                  .read<NotificationPageProvider>()
                  .deleteNotification(notification.index);

              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/ic-delete.svg',
                  color: Colors.white.withAlpha(100),
                ),
                const SizedBox(width: 10),
                Text(
                  'Delete Message',
                  style: kRegularStyle.copyWith(
                    color: Colors.white.withAlpha(100),
                    fontSize: kRegularSize,
                  ),
                )
              ],
            ),
          ),
           */
        ],
      ),
    );
  }
}

class _NFTNotificationDetailsBody extends StatelessWidget {
  const _NFTNotificationDetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Innings Festival',
            style: kSemiBoldStyle.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'March 19, 2022 - March 20, 2022',
            style: kRegularStyle.copyWith(
              color: Colors.white.withAlpha(100),
              fontSize: kRegularSize - 2,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Innings Festival is a 2-Day Spring Training celebration '
            'featuring top musical talent, MLB greats, baseball-'
            'themed activites and delectable local bites. This kick-'
            'off to Arizona\'s Spring Traininig welcomes all to '
            'Tempe Beach Park & Arts Park on March 19, 2022 - March '
            '20, 2022!',
            style: kRegularStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _NFTNotificationDetailsDiv extends StatelessWidget {
  const _NFTNotificationDetailsDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 60,
      color: kSlightlyDarkBlue,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}

class _NFTNotificationDetailsHeading extends StatelessWidget {
  const _NFTNotificationDetailsHeading({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20),
      child: Text(
        title,
        style: kSemiBoldStyle.copyWith(
          color: Colors.white,
          fontSize: kRegularSize + 2,
        ),
      ),
    );
  }
}
