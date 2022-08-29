import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/create_post_provider.dart';
import 'package:nft_ticketing/screens/dashboard/community_page/community_page.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  static const id = '${CommunityPage.id}/create';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreatePostProvider(),
      builder: (context, child) {
        final provider = context.read<CreatePostProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  const _NFTCreatePostPagePseudoBar(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverPadding(
                          padding: EdgeInsets.fromLTRB(20, 30, 0, 40),
                          sliver: SliverToBoxAdapter(
                            child: _NFTCreatePostPageConfig(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              maxLines: null,
                              onChanged: provider.onTextChanged,
                              style: kRegularStyle.copyWith(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'What do you want to talk about?',
                                hintStyle: kRegularStyle.copyWith(
                                  color: kGrayishBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Selector<CreatePostProvider, File?>(
                          selector: (_, p) => p.image,
                          builder: (ctx, image, __) {
                            if (image == null) {
                              return const SliverPadding(
                                padding: EdgeInsets.zero,
                              );
                            }

                            return _NFTCreatePostPageImage(image: image);
                          },
                        ),
                      ],
                    ),
                  ),
                  KeyboardVisibilityBuilder(
                    builder: (_, isVisible) {
                      if (!isVisible) {
                        return const _NFTCreatePostPageBottomSheet();
                      }

                      return const _NFTCreatePostPageActions();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NFTCreatePostPageImage extends StatelessWidget {
  const _NFTCreatePostPageImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File image;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CreatePostProvider>();

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      sliver: SliverToBoxAdapter(
        child: Stack(
          children: [
            Image.file(image),
            Positioned(
              top: 15,
              right: 15,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: provider.removePhoto,
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NFTCreatePostPageActions extends StatelessWidget {
  const _NFTCreatePostPageActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: bottomInset + 20),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/ic-take-a-picture.svg'),
          const SizedBox(width: 20),
          SvgPicture.asset('assets/icons/ic-upload-image.svg'),
          const SizedBox(width: 20),
          SvgPicture.asset('assets/icons/ic-take-a-video.svg'),
        ],
      ),
    );
  }
}

class _NFTCreatePostPageBottomSheet extends StatelessWidget {
  const _NFTCreatePostPageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DraggableScrollableSheet(
        initialChildSize: 0.25,
        maxChildSize: 1,
        expand: true,
        snap: true,
        snapSizes: const [0.25, 1],
        builder: (context, scrollController) {
          return Container(
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
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final provider = context.read<CreatePostProvider>();

                      return ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.only(top: 35, left: 20),
                        physics: const ClampingScrollPhysics(),
                        children: [
                          const _NFTCreatePostPageBottomSheetAction(
                            assetPath: 'assets/icons/ic-take-a-picture.svg',
                            actionText: 'Take a picture',
                            // provide code for getting via camera,
                            onTap: null,
                          ),
                          const SizedBox(height: 20),
                          _NFTCreatePostPageBottomSheetAction(
                            assetPath: 'assets/icons/ic-upload-image.svg',
                            actionText: 'Add a photo',
                            onTap: provider.getPhotoFromGallery,
                          ),
                          const SizedBox(height: 20),
                          const _NFTCreatePostPageBottomSheetAction(
                            assetPath: 'assets/icons/ic-take-a-video.svg',
                            actionText: 'Take a video',
                            // provide code for getting via camera,
                            onTap: null,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NFTCreatePostPageBottomSheetAction extends StatelessWidget {
  const _NFTCreatePostPageBottomSheetAction({
    Key? key,
    required this.assetPath,
    required this.actionText,
    this.onTap,
  }) : super(key: key);

  final String assetPath;
  final String actionText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 18,
            child: SvgPicture.asset(assetPath),
          ),
          const SizedBox(width: 16),
          Text(
            actionText,
            style: kRegularStyle.copyWith(
              color: Colors.white,
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
          Selector<CreatePostProvider, String>(
            selector: (_, p) => p.text,
            builder: (_, text, __) {
              return Positioned(
                right: 20,
                bottom: 30,
                child: NFTButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  text: 'Post',
                  color: text.isEmpty ? kSlightlyDarkBlue : kPrimaryColor,
                  textColor: text.isEmpty ? kGrayishBlue : Colors.white,
                  fontSize: kRegularSize - 2,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
