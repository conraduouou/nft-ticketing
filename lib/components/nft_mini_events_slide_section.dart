import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_event_mini_block.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/nft_event_details.dart';

class NFTMiniEventsSlideSection extends StatelessWidget {
  const NFTMiniEventsSlideSection({
    Key? key,
    required this.sectionTitle,
    required this.listOfEvents,
    this.showViewAll = true,
    this.onViewTap,
    this.listHeight,
    this.hasBottomPadding = false,
    this.blockOnTap,
  }) : super(key: key);

  final String sectionTitle;
  final bool showViewAll;
  final VoidCallback? onViewTap;

  // replace with different class in the future
  final List<NFTEventDetails> listOfEvents;
  final double? listHeight;
  final bool hasBottomPadding;

  final void Function(int index)? blockOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: kSemiBoldStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              showViewAll
                  ? GestureDetector(
                      onTap: onViewTap,
                      child: Text(
                        'View all (20)',
                        style: kRegularStyle.copyWith(color: kPrimaryColor),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        const SizedBox(height: 25),
        _NFTMiniEventsSlide(
          hasBottomPadding: hasBottomPadding,
          listOfEvents: listOfEvents,
          height: listHeight,
          onTap: blockOnTap,
        ),
      ],
    );
  }
}

class _NFTMiniEventsSlide extends StatelessWidget {
  const _NFTMiniEventsSlide({
    Key? key,
    required this.listOfEvents,
    this.height,
    this.hasBottomPadding = false,
    this.onTap,
  }) : super(key: key);

  // replace with different class in the future
  final List<NFTEventDetails> listOfEvents;
  final double? height;
  final bool hasBottomPadding;

  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: height ?? size.width / 2.01,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listOfEvents.length,
        separatorBuilder: (_, i) => const SizedBox(width: 10),
        itemBuilder: (ctx, i) {
          return Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? 20 : 0,
              right: i == listOfEvents.length - 1 ? 20 : 0,
            ),
            child: NFTEventMiniBlock(
              constraints: BoxConstraints(
                minWidth: size.width / 2.78,
                maxWidth: size.width / 2.3,
                minHeight: size.width / 3.15,
                maxHeight: size.width / 2.62,
              ),
              eventTitle: listOfEvents[i].eventTitle,
              date: listOfEvents[i].eventDate,
              assetPath: listOfEvents[i].assetPath,
              hasBottomPadding: hasBottomPadding,
              onTap: onTap != null ? () => onTap!(i) : null,
            ),
          );
        },
      ),
    );
  }
}
