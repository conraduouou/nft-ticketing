import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/search_page/search_page.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/community';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: CustomScrollView(
        slivers: [
          NFTSliverBar(
            floating: true,
            showCategories: false,
            toolbarHeight: 90,
            heroTag: SearchType.community,
            searchOnTap: () => Navigator.of(context).pushNamed(
              SearchPage.id,
              arguments: SearchType.community,
            ),
          ),
          const _NFTCommunityPagePost(),
        ],
      ),
    );
  }
}

class _NFTCommunityPagePost extends StatelessWidget {
  const _NFTCommunityPagePost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: kSlightlyDarkBlue,
            width: 1,
          ),
        )),
        child: Row(
          children: [
            Image.asset(
              'assets/community/img-avatar-2@2x.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                // onTap: () = >,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSlightlyDarkBlue,
                  ),
                  child: Text(
                    'What\'s on your mind?',
                    style: kRegularStyle.copyWith(color: kGrayishBlue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
