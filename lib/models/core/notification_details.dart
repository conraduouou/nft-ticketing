enum NotificationType {
  calendar,
  tag,
  message,
}

class NotificationDetails {
  NotificationDetails({
    required this.index,
    required this.type,
    required this.preview,
    required this.time,
    this.isNew = false,
  });

  final int index; // id
  final NotificationType type;
  final String preview;
  final String time;
  final bool isNew;
}
