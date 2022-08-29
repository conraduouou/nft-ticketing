import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/search_page/search_page.dart';
import 'package:nft_ticketing/screens/dashboard/user_chat/user_chat_page.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/messages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: CustomScrollView(
        slivers: [
          NFTSliverBar(
            heroTag: SearchType.messages,
            searchOnTap: () => Navigator.of(context).pushNamed(
              SearchPage.id,
              arguments: SearchType.messages,
            ),
            floating: true,
            showCategories: false,
            toolbarHeight: 90,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              for (int i = 0; i < 4; i++)
                _NFTMessagesPageUserBlock(
                  assetPath:
                      'assets/messages/img-messages-avatar-${i + 1}@2x.png',
                  isUnseen: i == 0,
                  username: 'Katie Faye',
                  message: 'Hello, how are you doing?',
                  onTap: () => Navigator.of(context).pushNamed(
                    UserChatPage.id,
                    arguments: 'Katie Faye',
                  ),
                )
            ]),
          )
        ],
      ),
    );
  }
}

class _NFTMessagesPageUserBlock extends StatelessWidget {
  const _NFTMessagesPageUserBlock({
    Key? key,
    required this.assetPath,
    required this.username,
    required this.message,
    this.isUnseen = false,
    this.onTap,
  }) : super(key: key);

  final String assetPath;
  final bool isUnseen;

  final String username;
  final String message;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        height: 90,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Image.asset(
                assetPath,
                height: 50,
                width: 50,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kSlightlyDarkBlue,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: kSemiBoldStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          message,
                          style: kRegularStyle.copyWith(
                            color: isUnseen
                                ? Colors.white
                                : Colors.white.withAlpha(100),
                            fontSize: kRegularSize - 2,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Now',
                      style: kRegularStyle.copyWith(
                        color: isUnseen
                            ? Colors.white
                            : Colors.white.withAlpha(100),
                        fontSize: kRegularSize - 4,
                      ),
                    ),
                    const SizedBox(width: 20)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
