import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nft_ticketing/components/nft_sliverbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/user.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';
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
          const _NFTCommunityPageCreatePost(),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              for (int i = 0; i < 3; i++)
                const _NFTCommunityPagePost(
                  userImgPath: 'assets/community/img-avatar-1@2x.png',
                  username: 'Katie Faye',
                  postText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Donec et urna lectus. Integer quis massa mi.',
                  imgPath: '',
                  likes: 4200,
                ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _NFTCommunityPageCreatePost extends StatelessWidget {
  const _NFTCommunityPageCreatePost({
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
            // replace with Image.network in the future
            Image.asset(
              'assets/community/img-avatar-2@2x.png',
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) => _errorBuilder(),
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

  Container _errorBuilder() {
    return Container(
      height: 40,
      width: 40,
      decoration:
          const BoxDecoration(color: kSlightlyDarkBlue, shape: BoxShape.circle),
    );
  }
}

class _NFTCommunityPagePost extends StatelessWidget {
  const _NFTCommunityPagePost({
    Key? key,
    required this.userImgPath,
    required this.username,
    this.imgPath,
    this.postText,
    this.likes = 0,
  }) : super(key: key);

  final String userImgPath, username;
  final String? imgPath, postText;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        _NFTCommunityPagePostUserHeading(
          imagePath: userImgPath,
          username: username,
        ),
        const SizedBox(height: 30),
        postText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  postText!,
                  style: kRegularStyle.copyWith(
                    color: Colors.white,
                    fontSize: kRegularSize - 2,
                  ),
                ),
              )
            : Container(),
        postText != null ? const SizedBox(height: 30) : Container(),
        Image.asset(
          '', // replace asset path in prod
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 200,
              color: kSlightlyDarkBlue,
            );
          },
        ),
        likes != 0 ? const SizedBox(height: 20) : Container(),
        likes != 0 ? _NFTCommunityPagePostLikes(likes: likes) : Container(),
        const _NFTCommunityPageDiv(),
        Row(
          children: const [
            _NFTCommunityPagePostActionButton(
              assetPath: 'assets/icons/ic-like.svg',
              actionText: 'Like',
            ),
            _NFTCommunityPagePostActionButton(
              assetPath: 'assets/icons/ic-message.svg',
              actionText: 'Message',
            ),
            _NFTCommunityPagePostActionButton(
              assetPath: 'assets/icons/ic-share.svg',
              actionText: 'Share',
            ),
          ],
        ),
        const _NFTCommunityPageDiv(),
      ],
    );
  }
}

class _NFTCommunityPagePostUserHeading extends StatelessWidget {
  const _NFTCommunityPagePostUserHeading({
    Key? key,
    required this.imagePath,
    required this.username,
  }) : super(key: key);

  final String imagePath, username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () => Navigator.of(context).pushNamed(
                AccountPage.id,
                arguments: User(
                  name: 'Katie Faye',
                  email: 'katiefaye_100@gmail.com',
                  imgPath: 'assets/community/img-avatar-1@3x.png',
                  posts: 11,
                  following: 200,
                  followers: 1300,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    imagePath,
                    height: 40,
                    width: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: kSlightlyDarkBlue,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  Text(
                    username,
                    style: kRegularStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const _NFTCommunityPageFollowWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NFTCommunityPageFollowWidget extends StatefulWidget {
  const _NFTCommunityPageFollowWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_NFTCommunityPageFollowWidget> createState() =>
      _NFTCommunityPageFollowWidgetState();
}

class _NFTCommunityPageFollowWidgetState
    extends State<_NFTCommunityPageFollowWidget> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          _isFollowing = !_isFollowing;
        });
      },
      child: Row(
        children: [
          !_isFollowing
              ? Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: const Icon(
                    Icons.add_sharp,
                    color: Colors.white,
                    size: 15,
                  ),
                )
              : Container(),
          !_isFollowing ? const SizedBox(width: 7) : Container(),
          Text(
            !_isFollowing ? 'Follow' : 'Following',
            style: kRegularStyle.copyWith(
              color: kPrimaryColor,
              fontSize: kRegularSize - 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _NFTCommunityPagePostLikes extends StatelessWidget {
  const _NFTCommunityPagePostLikes({
    Key? key,
    required this.likes,
  }) : super(key: key);

  final int likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        SizedBox(
          width: 16,
          child: SvgPicture.asset('assets/icons/ic-like.svg'),
        ),
        const SizedBox(width: 10),
        Text(
          '${NumberFormat.compact().format(likes)} likes',
          style: kRegularStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize - 2,
          ),
        ),
      ],
    );
  }
}

class _NFTCommunityPagePostActionButton extends StatelessWidget {
  const _NFTCommunityPagePostActionButton({
    Key? key,
    required this.assetPath,
    required this.actionText,
  }) : super(key: key);

  final String assetPath, actionText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 19,
            child: SvgPicture.asset(assetPath),
          ),
          const SizedBox(width: 10),
          Text(
            actionText,
            style: kRegularStyle.copyWith(
              color: Colors.white,
              fontSize: kRegularSize - 2,
            ),
          )
        ],
      ),
    );
  }
}

class _NFTCommunityPageDiv extends StatelessWidget {
  const _NFTCommunityPageDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 40,
      color: kSlightlyDarkBlue,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}
