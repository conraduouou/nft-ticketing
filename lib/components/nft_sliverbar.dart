import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/notification_page/notification_page.dart';
import 'package:nft_ticketing/screens/dashboard/search_page/search_page.dart';

class NFTSliverBar extends StatelessWidget {
  const NFTSliverBar({
    Key? key,
    this.isHome = true,
    this.pinned = false,
    this.onChanged,
    this.initialText,
  }) : super(key: key);

  final bool isHome;
  final bool pinned;
  final void Function(String s)? onChanged;
  final String? initialText;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kDarkBlue,
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: isHome ? 150 : 90,
      pinned: pinned,
      shape: const Border(
        bottom: BorderSide(
          width: 1,
          color: kSlightlyDarkBlue,
        ),
      ),
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Flexible(
                  child: Hero(
                    tag: 'search',
                    child: Material(
                      color: Colors.transparent,
                      child: NFTField(
                        initialText: initialText,
                        onChanged: onChanged,
                        fontSize: kRegularSize - 2,
                        radius: 30,
                        height: 40,
                        padding: EdgeInsets.zero,
                        hintText: 'Search',
                        hintColor: kSecondaryColor,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 10),
                          child: SvgPicture.asset(
                            'assets/icons/ic_search.svg',
                          ),
                        ),
                        onClear: () {
                          if (onChanged != null) onChanged!('');
                        },
                        onTap: () {
                          if (isHome) {
                            Navigator.of(context).pushNamed(SearchPage.id);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                isHome
                    ? const _NFTSliverBarNotification()
                    : GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          'Cancel',
                          style: kRegularStyle.copyWith(color: kPrimaryColor),
                        ),
                      ),
              ],
            ),
          ),
          isHome ? const SizedBox(height: 25) : Container(),
          isHome ? const _NFTSliverBarCategories() : Container(),
        ],
      ),
    );
  }
}

class _NFTSliverBarCategories extends StatelessWidget {
  const _NFTSliverBarCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (ctx, i) {
          final list = <String>['Music', 'ESports', 'Sporting', 'Others'];

          return Row(
            children: [
              i == 0 ? const SizedBox(width: 20) : Container(),
              SizedBox(
                width: 105,
                child: NFTButton(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  text: list[i],
                  color: i == 0 ? kPrimaryColor : kSlightlyDarkBlue,
                  textColor: i == 0 ? null : kSecondaryColor,
                ),
              ),
              SizedBox(width: i != 3 ? 10 : 20),
            ],
          );
        },
      ),
    );
  }
}

class _NFTSliverBarNotification extends StatelessWidget {
  const _NFTSliverBarNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => Navigator.of(context).pushNamed(NotificationPage.id),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: SvgPicture.asset(
              'assets/icons/ic-notification.svg',
            ),
          ),
          Positioned(
            right: -4,
            top: -4,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  top: -1,
                  child: Text(
                    '9', // use some kind of provider for this
                    textAlign: TextAlign.center,
                    style: kRegularStyle.copyWith(
                      fontSize: 10, // make this resizable
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
