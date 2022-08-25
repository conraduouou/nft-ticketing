import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

enum NotificationType {
  calendar,
  tag,
  message,
}

class NotificationDetails {
  NotificationDetails({
    required this.type,
    required this.preview,
    required this.time,
    this.isNew = false,
  });

  final NotificationType type;
  final String preview;
  final String time;
  final bool isNew;
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/notifications';

  @override
  Widget build(BuildContext context) {
    final list = <NotificationDetails>[
      NotificationDetails(
        type: NotificationType.calendar,
        preview: 'You have 1 upcoming event',
        time: '1:10 PM',
        isNew: true,
      ),
      NotificationDetails(
        type: NotificationType.tag,
        preview: 'You purchased Innings Festival ticket',
        time: '10:25 AM',
      ),
      NotificationDetails(
        type: NotificationType.calendar,
        preview: 'Thank you for attending High Waters!',
        time: 'Tue',
      ),
      NotificationDetails(
        type: NotificationType.message,
        preview: 'Welcome to NFT Ticketing',
        time: 'Mon',
      ),
    ];

    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(
        title: 'Notifications',
        height: kToolbarHeight + 30,
        showDivider: true,
      ),
      body: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) => const Divider(
          height: 60,
          color: kSecondaryColor,
          indent: 20,
          endIndent: 20,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                index == 0 ? const SizedBox(height: 30) : Container(),
                _NFTNotificationItem(
                  isNew: index == 0,
                  notificationType: list[index].type,
                  notificationPreview: list[index].preview,
                  time: list[index].time,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NFTNotificationItem extends StatelessWidget {
  const _NFTNotificationItem({
    Key? key,
    required this.notificationType,
    required this.notificationPreview,
    required this.time,
    required this.isNew,
  }) : super(key: key);

  final NotificationType notificationType;
  final String notificationPreview;
  final String time;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _NFTNotificationIcon(notificationType: notificationType),
            const SizedBox(width: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width / 1.75),
              child: _NFTNotificationPreview(preview: notificationPreview),
            ),
            const SizedBox(width: 10),
          ],
        ),
        _NFTNotificationTime(time: time, isNew: isNew),
      ],
    );
  }
}

class _NFTNotificationTime extends StatelessWidget {
  const _NFTNotificationTime({
    Key? key,
    this.isNew = false,
    required this.time,
  }) : super(key: key);

  final String time;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          time,
          style: kRegularStyle.copyWith(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        isNew
            ? Container(
                height: 9,
                width: 9,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
              )
            : Container(),
      ],
    );
  }
}

class _NFTNotificationPreview extends StatelessWidget {
  const _NFTNotificationPreview({
    Key? key,
    required this.preview,
  }) : super(key: key);

  final String preview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          preview,
          overflow: TextOverflow.ellipsis,
          style: kSemiBoldStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize - 2,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Lorem ipsum dolor sit amet...',
          style: kRegularStyle.copyWith(
            color: Colors.white.withAlpha(100),
            fontSize: kRegularSize - 4,
          ),
        ),
      ],
    );
  }
}

class _NFTNotificationIcon extends StatelessWidget {
  const _NFTNotificationIcon({
    Key? key,
    required this.notificationType,
  }) : super(key: key);

  final NotificationType notificationType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(11),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kSlightlyDarkBlue,
      ),
      child: SvgPicture.asset(
        'assets/icons/ic-${notificationType.name}.svg',
        color: kPrimaryColor,
      ),
    );
  }
}
