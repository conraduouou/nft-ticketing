import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/event-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              const _NFTEventDetailsHeading(),
              const _NFTEventDetailsDescriptionBlock(),
              const _NFTEventDetailsDiv(),
              Column(
                children: [],
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class _NFTEventDetailsHeading extends StatelessWidget {
  const _NFTEventDetailsHeading({
    Key? key,
    // ignore: unused_element
    this.assetPath,
  }) : super(key: key);

  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          assetPath ??
              'assets/event_details/img-banner-1@2x.png', // remove in prod
          width: size.width,
        ),
        const Positioned(
          top: 30,
          left: 20,
          child: NFTBackButton(
            height: 40,
            width: 40,
          ),
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
        const _NFTEventDetailsDescription(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _NFTEventDetailsActionButton(
              assetPath: 'assets/icons/ic-like.svg',
            ),
            SizedBox(width: 15),
            _NFTEventDetailsActionButton(
              assetPath: 'assets/icons/ic-message.svg',
              padding: 11,
            ),
            SizedBox(width: 15),
            _NFTEventDetailsActionButton(
              assetPath: 'assets/icons/ic-share.svg',
              padding: 11,
            ),
          ],
        ),
      ],
    );
  }
}

class _NFTEventDetailsDescription extends StatelessWidget {
  const _NFTEventDetailsDescription({
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
  }) : super(key: key);

  final String? assetPath;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _NFTEventDetailsDiv extends StatelessWidget {
  const _NFTEventDetailsDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 60,
      color: kSlightlyDarkBlue,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}
