import 'package:intl/intl.dart';

class Message {
  const Message({
    required this.message,
    required this.isSentByMe,
    required this.date,
  });

  final String message;
  final bool isSentByMe;

  final DateTime date;

  String get monthString => DateFormat.MMMM().format(date);
}
