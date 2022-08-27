import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_banner.dart';
import 'package:nft_ticketing/components/nft_bottom_sheet.dart';
import 'package:nft_ticketing/components/nft_checkout_footer.dart';
import 'package:nft_ticketing/components/nft_dialog.dart';
import 'package:nft_ticketing/components/nft_mini_events_slide_section.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/nft_event_details.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/dashboard/review_order/review_order.dart';
import 'package:share_plus/share_plus.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/event-details';

  void _showDialog(BuildContext context) {
    showDialog(
      barrierColor: kDialogBarrierColor,
      context: context,
      builder: (context) => NFTDialog(
        headingText: 'General Admission',
        subText: '(inclusion details here)',
        buttonText: 'Close',
        subTextColor: Colors.white.withAlpha(100),
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    const NFTBanner(),
                    const _NFTEventDetailsDescriptionBlock(),
                    const _NFTEventDetailsDiv(),
                    // the Builder is needed here to retrieve the Scaffold context
                    Builder(
                      builder: (ctx) {
                        return _NFTEventDetailsActual(
                          infoOnTap: () => _showDialog(context),
                          selectOnTap: () =>
                              NFTBottomSheet.showBottomSheet(context),
                        );
                      },
                    ),
                    const _NFTEventDetailsDiv(height: 70, hasIndent: false),
                    NFTMiniEventsSlideSection(
                      hasBottomPadding: true,
                      showViewAll: false,
                      listHeight: 260,
                      sectionTitle: 'Suggestions for you',
                      listOfEvents: [
                        for (int i = 0; i < 3; i++)
                          NFTEventDetails(
                            assetPath: '',
                            eventTitle: i == 0 ? 'Lost Lands' : 'Something',
                          )
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
          NFTCheckoutFooter(
            buttonText: 'Buy Ticket',
            onPressed: () =>
                Navigator.of(context).pushNamed(ReviewOrderPage.id),
          ),
        ],
      ),
    );
  }
}

class _NFTEventDetailsActual extends StatelessWidget {
  const _NFTEventDetailsActual({
    Key? key,
    required this.infoOnTap,
    required this.selectOnTap,
  }) : super(key: key);

  final VoidCallback infoOnTap;
  final VoidCallback selectOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const _NFTEventDetailsDescriptionLine(
            assetPath: 'assets/icons/ic-calendar.svg',
            mainText: 'March 19 & 20',
            subText: '2:00 PM - 5:00 PM',
          ),
          const SizedBox(height: 30),
          const _NFTEventDetailsDescriptionLine(
            assetPath: 'assets/icons/ic-location.svg',
            mainText: 'Tampa, FL',
            subText: 'Raymond James Stadium Grounds',
          ),
          const SizedBox(height: 30),
          _NFTEventDetailsDescriptionLine(
            assetPath: 'assets/icons/ic-currency.svg',
            mainText: 'US \$50.00',
            subText: 'General admission',
            isPrice: true,
            infoOnTap: infoOnTap,
            selectOnTap: selectOnTap,
          ),
        ],
      ),
    );
  }
}

class _NFTEventDetailsDescriptionLine extends StatelessWidget {
  const _NFTEventDetailsDescriptionLine({
    Key? key,
    this.isPrice = false,
    this.infoOnTap,
    this.selectOnTap,
    required this.assetPath,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  final bool isPrice;
  final VoidCallback? infoOnTap;
  final VoidCallback? selectOnTap;
  final String assetPath;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: SvgPicture.asset(assetPath),
            ),
            const SizedBox(width: 10),
            _NFTEventDetailsDescriptionLineText(
              mainText: mainText,
              subText: subText,
              isPrice: isPrice,
              infoOnTap: infoOnTap,
            ),
          ],
        ),
        isPrice ? const Spacer() : Container(),
        isPrice
            ? GestureDetector(
                onTap: selectOnTap,
                child: Row(
                  children: [
                    Text(
                      'Select Ticket',
                      style: kSemiBoldStyle.copyWith(
                        color: kPrimaryColor,
                        fontSize: kRegularSize - 4,
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Icon(
                      Icons.chevron_right_sharp,
                      color: kPrimaryColor,
                      size: kRegularSize + 2,
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}

class _NFTEventDetailsDescriptionLineText extends StatelessWidget {
  const _NFTEventDetailsDescriptionLineText({
    Key? key,
    required this.mainText,
    required this.subText,
    required this.isPrice,
    required this.infoOnTap,
  }) : super(key: key);

  final String mainText;
  final String subText;
  final bool isPrice;
  final VoidCallback? infoOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: kRegularStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize - 2,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text(
              subText,
              style: kRegularStyle.copyWith(
                color: Colors.white.withAlpha(100),
                fontSize: kRegularSize - 4,
              ),
            ),
            isPrice ? const SizedBox(width: 3) : Container(),
            isPrice
                ? GestureDetector(
                    onTap: infoOnTap,
                    child: const Icon(
                      Icons.info,
                      color: kPrimaryColor,
                      size: kRegularSize + 2,
                    ),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}

class _NFTEventDetailsDescriptionBlock extends StatelessWidget {
  const _NFTEventDetailsDescriptionBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          'Innings Festival',
          style: kSemiBoldStyle.copyWith(
            color: Colors.white,
            fontSize: kLargeSize - 6,
          ),
        ),
        const SizedBox(height: 20),
        const _NFTEventDetailsDescriptionText(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _NFTEventDetailsActionButton(
              assetPath: 'assets/icons/ic-like.svg',
            ),
            const SizedBox(width: 15),
            const _NFTEventDetailsActionButton(
              assetPath: 'assets/icons/ic-message.svg',
              padding: 11,
            ),
            const SizedBox(width: 15),
            _NFTEventDetailsActionButton(
              assetPath: 'assets/icons/ic-share.svg',
              padding: 11,
              onTap: () => Share.share('NFT Ticketing'),
            ),
          ],
        ),
      ],
    );
  }
}

class _NFTEventDetailsDescriptionText extends StatelessWidget {
  const _NFTEventDetailsDescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: kRegularStyle.copyWith(
            color: Colors.white,
          ),
          children: [
            const TextSpan(
              text: 'The first Innings Festival took place in '
                  '2018. Since it received positive reviews and '
                  'good attendance, it returned in... ',
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  // handle see more
                },
                child: Text(
                  'see more',
                  style: kBoldStyle.copyWith(
                    color: kPrimaryColor,
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

class _NFTEventDetailsActionButton extends StatelessWidget {
  const _NFTEventDetailsActionButton({
    Key? key,
    this.assetPath,
    this.padding,
    this.onTap,
  }) : super(key: key);

  final String? assetPath;
  final double? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(padding ?? 10),
        decoration: const BoxDecoration(
          color: kSlightlyDarkBlue,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          assetPath ?? 'assets/icons/ic-like.svg', // remove in prod
        ),
      ),
    );
  }
}

class _NFTEventDetailsDiv extends StatelessWidget {
  const _NFTEventDetailsDiv({
    Key? key,
    this.hasIndent = true,
    this.height,
  }) : super(key: key);

  final double? height;
  final bool hasIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 60,
      color: kSlightlyDarkBlue,
      thickness: 1,
      indent: hasIndent ? 20 : 0,
      endIndent: hasIndent ? 20 : 0,
    );
  }
}
