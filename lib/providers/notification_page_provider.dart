import 'package:flutter/material.dart';
import 'package:nft_ticketing/models/core/notification_details.dart';

class NotificationPageProvider with ChangeNotifier {
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

  void deleteNotification(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
