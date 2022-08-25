import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/nft_event_details.dart';
import 'package:nft_ticketing/screens/dashboard/event_details/event_details.dart';

class NFTMiniEventsSlideSection extends StatelessWidget {
  const NFTMiniEventsSlideSection({
    Key? key,
    required this.sectionTitle,
    required this.listOfEvents,
    this.showViewAll = true,
    this.onViewTap,
    this.listHeight,
  }) : super(key: key);

  final String sectionTitle;
  final bool showViewAll;
  final VoidCallback? onViewTap;

  // replace with different class in the future
  final List<NFTEventDetails> listOfEvents;
  final double? listHeight;

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
          listOfEvents: listOfEvents,
          height: listHeight,
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
  }) : super(key: key);

  // replace with different class in the future
  final List<NFTEventDetails> listOfEvents;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 195,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NFTEventMiniBlock(
                  eventTitle: listOfEvents[i].eventTitle,
                  date: listOfEvents[i].eventDate,
                  assetPath: listOfEvents[i].assetPath,
                  hasBottomPadding: false,
                  onTap: () {
                    Navigator.of(context).pushNamed(EventDetailsPage.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NFTEventMiniBlock extends StatelessWidget {
  const _NFTEventMiniBlock({
    Key? key,
    required this.eventTitle,
    this.date,
    this.assetPath,
    this.hasBottomPadding = true,
    this.onTap,
  }) : super(key: key);

  final String eventTitle;
  final String? assetPath;
  final String? date;
  final bool hasBottomPadding;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            assetPath ?? '',
            height: 150,
            width: 170,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Container(
                  height: 150,
                  width: 170,
                  decoration: BoxDecoration(
                      color: kSlightlyDarkBlue,
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          eventTitle,
          style: kRegularStyle.copyWith(
            color: Colors.white,
          ),
        ),
        date != null ? const SizedBox(height: 5) : Container(),
        date != null
            ? Text(
                date!,
                style: kRegularStyle.copyWith(
                  color: kSecondaryColor,
                ),
              )
            : Container(),
        hasBottomPadding ? const SizedBox(height: 40) : Container(),
      ],
    );
  }
}
