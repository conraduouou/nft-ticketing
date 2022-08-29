import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/community_page/community_page.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  static const id = '${CommunityPage.id}/create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      bottomSheet: Container(
        color: kDarkBlue,
        child: Container(
          height: 200,
          decoration: const BoxDecoration(
            color: kSlightlyDarkBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const _NFTCreatePostPagePseudoBar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.only(left: 20, top: 30, bottom: 40),
                  sliver: SliverToBoxAdapter(
                    child: _NFTCreatePostPageConfig(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: null,
                      style: kRegularStyle.copyWith(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NFTCreatePostPageConfig extends StatelessWidget {
  const _NFTCreatePostPageConfig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/community/img-avatar-2@2x.png',
          height: 50,
          width: 50,
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(
              'Juan dela Cruz',
              style: kRegularStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize - 2,
              ),
            ),
            const SizedBox(height: 5),
            NFTButton(
              padding: const EdgeInsets.fromLTRB(15, 4, 10, 4),
              color: kDarkBlue,
              border: Border.all(
                color: kGrayishBlue,
                width: 1,
              ),
              widget: Row(
                children: [
                  Text(
                    'Anyone',
                    style: kRegularStyle.copyWith(
                      color: kGrayishBlue,
                      fontSize: kRegularSize - 4,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: kGrayishBlue,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NFTCreatePostPagePseudoBar extends StatelessWidget {
  const _NFTCreatePostPagePseudoBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kSlightlyDarkBlue, width: 1),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          const Positioned(
            bottom: 25,
            left: 20,
            child: NFTBackButton(height: 40, width: 40),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Text(
                'Create Post',
                style: kRegularStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            right: 20,
            bottom: 30,
            child: NFTButton(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              text: 'Post',
              color: kSlightlyDarkBlue,
              textColor: kGrayishBlue,
              fontSize: kRegularSize - 2,
            ),
          ),
        ],
      ),
    );
  }
}
