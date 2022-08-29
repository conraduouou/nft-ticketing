import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_event_block.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/search_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:provider/provider.dart';

enum SearchType {
  home,
  community,
  messages,
}

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
    this.searchType = SearchType.home,
  }) : super(key: key);

  static const id = '${DashboardContainer.id}/search';

  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    RegExp exp1 = RegExp(r'[ingsfetvalINGSFETVAL]');
    RegExp exp2 = RegExp(r'[jamesrolnd]');

    return ChangeNotifierProvider(
      create: (context) => SearchPageProvider(),
      builder: (context, child) {
        final provider = context.read<SearchPageProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          body: CustomScrollView(
            slivers: [
              NFTSliverBar(
                heroTag: searchType,
                pinned: true,
                showCategories: false,
                showNotifications: false,
                requestFocus: true,
                toolbarHeight: 90,
                initialText: provider.searchQuery,
                onChanged: provider.onSearchChanged,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Consumer<SearchPageProvider>(
                    builder: (_, provider, __) {
                      final size = MediaQuery.of(context).size;
                      final topPadding = size.height / 4;

                      final isHome = provider.searchQuery.contains(exp1) &&
                          searchType == SearchType.home;

                      final isMessages = provider.searchQuery.contains(exp2) &&
                          searchType == SearchType.messages;

                      Widget? child;

                      if (provider.searchQuery.isEmpty) {
                        child = Container();
                      } else if (provider.inAsync) {
                        // loading state
                        child = Column(
                          key: const ValueKey<int>(0),
                          children: [
                            SizedBox(height: topPadding),
                            const CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          ],
                        );
                      } else if (isHome) {
                        child = _NFTSearchPageListView(
                          key: const ValueKey<int>(1),
                          searchType: searchType,
                        );
                      } else if (isMessages) {
                        child = _NFTSearchPageListView(
                          key: const ValueKey<int>(1),
                          searchType: searchType,
                        );
                      } else {
                        // empty state; replace with empty condition
                        child = Column(
                          key: const ValueKey<int>(2),
                          children: [
                            SizedBox(height: topPadding - 40),
                            Text(
                              'No results were found',
                              style: kSemiBoldStyle.copyWith(
                                fontSize: kLargeSize - 4,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Try searching with different keywords.',
                              style: kRegularStyle.copyWith(
                                color: kSecondaryColor,
                              ),
                            )
                          ],
                        );
                      }

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: child,
                        layoutBuilder: (currentChild, previousChildren) {
                          return Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              ...previousChildren,
                              if (currentChild != null) currentChild,
                            ],
                          );
                        },
                      );
                    },
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NFTSearchPageListView extends StatelessWidget {
  const _NFTSearchPageListView({
    Key? key,
    required this.searchType,
  }) : super(key: key);

  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      key: key,
      height: size.height,
      child: ListView.separated(
        itemCount: 1,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        separatorBuilder: (_, __) => searchType == SearchType.home
            ? const SizedBox(height: 30)
            : Container(),
        itemBuilder: (_, i) {
          if (searchType == SearchType.home) {
            return NFTEventBlock(
              eventTitle: 'Innings Festival',
              topPadding: i == 0 ? 10 : null,
            );
          } else if (searchType == SearchType.messages) {
            return const NFTChatBlock(
              imgAssetPath: 'assets/messages/img-messages-avatar-2@2x.png',
              username: 'James Roland',
            );
          }

          return Container();
        },
      ),
    );
  }
}

class NFTChatBlock extends StatelessWidget {
  const NFTChatBlock({
    Key? key,
    required this.imgAssetPath,
    required this.username,
  }) : super(key: key);

  final String imgAssetPath;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kSlightlyDarkBlue,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imgAssetPath,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 15),
              Text(
                username,
                style: kRegularStyle.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
