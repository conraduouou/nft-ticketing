import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/message.dart';
import 'package:nft_ticketing/screens/dashboard/messages_page/messages_page.dart';

class UserChatPage extends StatelessWidget {
  const UserChatPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  static const id = '${MessagesPage.id}/chat';

  final String username;

  Widget _itemBuilder(
      BuildContext context, List<Message> messages, Message currentMessage) {
    final messageIndex = messages.indexOf(currentMessage);
    final showUser = messageIndex == 0 && !currentMessage.isSentByMe
        ? true
        : messages[messageIndex - 1].isSentByMe && !currentMessage.isSentByMe;

    final notSameUser = messageIndex == 0
        ? false
        : currentMessage.isSentByMe && !messages[messageIndex - 1].isSentByMe ||
            !currentMessage.isSentByMe && messages[messageIndex - 1].isSentByMe;

    return _NFTUserChatPageMessage(
      outsidePadding: notSameUser
          ? const EdgeInsets.only(top: 30)
          : const EdgeInsets.only(top: 15),
      message: currentMessage,
      showUser: showUser,
      isLastMessage: messageIndex == messages.length - 1,
    );
  }

  Widget _groupHeaderBuilder(List<Message> messages, Message currentMessage) {
    final messageIndex = messages.indexOf(currentMessage);
    final now = DateTime.now();
    final prefixString = currentMessage.date.day == now.day
        ? 'Today, '
        : currentMessage.date.day == now.day - 1
            ? 'Yesterday, '
            : '';

    final notSameUser = messageIndex == 0
        ? false
        : currentMessage.isSentByMe && !messages[messageIndex - 1].isSentByMe ||
            !currentMessage.isSentByMe && messages[messageIndex - 1].isSentByMe;

    return Padding(
      padding: notSameUser
          ? const EdgeInsets.only(top: 30)
          : const EdgeInsets.symmetric(vertical: 30),
      child: Text(
        '$prefixString'
        '${currentMessage.monthString} ${currentMessage.date.day}',
        textAlign: TextAlign.center,
        style: kRegularStyle.copyWith(
          fontSize: kRegularSize - 2,
          color: kGrayishBlue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages = <Message>[
      Message(
        message: 'Hello, I\'m Katie!',
        isSentByMe: false,
        date: DateTime(2022, 8, 28),
      ),
      Message(
        message: 'How are you doing?',
        isSentByMe: false,
        date: DateTime(2022, 8, 28),
      ),
      Message(
        message: 'Hi!',
        isSentByMe: true,
        date: DateTime(2022, 8, 29),
      ),
      Message(
        message: 'I\'m good! How about you?',
        isSentByMe: true,
        date: DateTime(2022, 8, 29),
      ),
      Message(
        message: 'That\'s great!',
        isSentByMe: false,
        date: DateTime(2022, 8, 29),
      ),
    ];

    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: NFTAppBar(title: username),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              elements: messages,
              groupHeaderBuilder: (message) =>
                  _groupHeaderBuilder(messages, message),
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              itemBuilder: (context, message) =>
                  _itemBuilder(context, messages, message),
              padding: const EdgeInsets.only(bottom: 50),
            ),
          ),
          const _NFTUserChatPageField(),
        ],
      ),
    );
  }
}

class _NFTUserChatPageMessage extends StatelessWidget {
  const _NFTUserChatPageMessage({
    Key? key,
    required this.showUser,
    required this.message,
    this.outsidePadding = const EdgeInsets.only(top: 15),
    this.isLastMessage = false,
  }) : super(key: key);

  final bool showUser;
  final bool isLastMessage;
  final EdgeInsets outsidePadding;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsidePadding,
      child: Align(
        alignment:
            message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            !message.isSentByMe
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 16),
                    child: showUser
                        ? Image.asset(
                            'assets/messages/img-messages-avatar-1@2x.png',
                            height: 50,
                            width: 50,
                          )
                        : const SizedBox(height: 50, width: 50),
                  )
                : Container(),
            Column(
              crossAxisAlignment: message.isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: message.isSentByMe ? kPrimaryColor : kSecondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message.message,
                    style: kRegularStyle.copyWith(
                      color: Colors.white,
                      fontSize: kRegularSize - 2,
                    ),
                  ),
                ),
                isLastMessage
                    ? Text(
                        DateFormat.jm().format(message.date),
                        style: kRegularStyle.copyWith(
                          color: kGrayishBlue,
                          fontSize: kRegularSize - 2,
                        ),
                      )
                    : Container()
              ],
            ),
            message.isSentByMe ? const SizedBox(width: 20) : Container(),
          ],
        ),
      ),
    );
  }
}

class _NFTUserChatPageField extends StatelessWidget {
  const _NFTUserChatPageField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: kSlightlyDarkBlue,
            ),
            child: SvgPicture.asset(
              'assets/icons/ic-upload-image.svg',
              color: kSecondaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NFTField(
              height: 50,
              radius: 7,
              hintText: 'Type something...',
              hintColor: kGrayishBlue,
              fontSize: kRegularSize - 2,
              showSuffix: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
