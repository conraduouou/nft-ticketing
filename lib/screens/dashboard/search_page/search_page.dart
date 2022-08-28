import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_event_block.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/search_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchPageProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: kDarkBlue,
          body: CustomScrollView(
            slivers: [
              NFTSliverBar(
                toolbarHeight: 90,
                showCategories: false,
                showNotifications: false,
                requestFocus: true,
                initialText: context.read<SearchPageProvider>().searchQuery,
                pinned: true,
                onChanged: context.read<SearchPageProvider>().onSearchChanged,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Consumer<SearchPageProvider>(
                    builder: (_, provider, __) {
                      final size = MediaQuery.of(context).size;
                      final topPadding = size.height / 4;

                      Widget? child;

                      if (provider.inAsync) {
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
                      } else if (provider.searchQuery
                          .contains(RegExp(r'[ingsfetvalINGSFETVAL]'))) {
                        child = SizedBox(
                          key: const ValueKey<int>(1),
                          height: size.height,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.separated(
                              itemCount: 1,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 30),
                              itemBuilder: (_, i) {
                                return NFTEventBlock(
                                  eventTitle: 'Innings Festival',
                                  topPadding: i == 0 ? 10 : null,
                                );
                              },
                            ),
                          ),
                        );
                      } else if (provider.searchQuery.isEmpty) {
                        child = Container();
                      } else {
                        // empty state; replace with empty condition
                        child = Column(
                          key: const ValueKey<int>(2),
                          children: [
                            SizedBox(height: topPadding - 40),
                            Text(
                              'No results were found',
                              style: kSemiBoldStyle.copyWith(
                                fontSize: kLargeSize,
                                color: Colors.white,
                              ),
                            ),
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
