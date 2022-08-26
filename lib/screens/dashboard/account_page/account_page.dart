import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Stack(
                clipBehavior: Clip.none,
                children: const [
                  _NFTAccountPageBanner(),
                  _NFTAccountPageAvatar(),
                ],
              ),
              const SizedBox(height: 65),
              const _NFTAccountPageUser(),
              const SizedBox(height: 40),
              const _NFTAccountPageUserDetails(),
              const _NFTAccountPageDiv(),
              const _NFTAccountPageTicketViewButtons(),
              const SizedBox(height: 25),
              const _NFTAccountPageHeading(isUpcoming: true),
              const SizedBox(height: 25),
              const _NFTAccountPageDateViewButtons(),
              const SizedBox(height: 30),
              for (int i = 0; i < 2; i++)
                Column(
                  children: [
                    _NFTAccountPageTicket(
                      eventTitle: i == 0 ? 'Innings Festival' : 'High Water',
                      eventDate: i == 0 ? 'March 19-March 20' : 'April 23 & 24',
                    ),
                    i != 1 ? const SizedBox(height: 20) : Container(),
                  ],
                ),
              const SizedBox(height: 40)
            ]),
          ),
        ],
      ),
    );
  }
}

class _NFTAccountPageTicket extends StatelessWidget {
  const _NFTAccountPageTicket({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  final String eventTitle;
  final String eventDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: _NFTAccountPageTicketContent(
                    eventTitle: eventTitle,
                    eventDate: eventDate,
                  ),
                ),
                Image.asset(
                  'assets/homepage/img-happeningnow-1@2x-cropped.png',
                  width: 135,
                )
              ],
            ),
          ),
          Positioned(
            left: -6.5,
            bottom: 40,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: kDarkBlue,
                shape: BoxShape.circle,
                border: Border.all(color: kSecondaryColor, width: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NFTAccountPageTicketContent extends StatelessWidget {
  const _NFTAccountPageTicketContent({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  final String eventTitle;
  final String eventDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventTitle,
              style: kSemiBoldStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize - 1,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              eventDate,
              style: kRegularStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize - 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'View ticket',
          style: kRegularStyle.copyWith(
            color: kPrimaryColor,
            fontSize: kRegularSize - 3,
          ),
        )
      ],
    );
  }
}

class _NFTAccountPageDateViewButtons extends StatelessWidget {
  const _NFTAccountPageDateViewButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 35,
      child: Row(
        children: [
          for (int i = 0; i < 2; i++)
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: NFTButton(
                    text: i == 0 ? 'Upcoming' : 'Past Tickets',
                    fontWeight: i == 0 ? FontWeight.w600 : null,
                    color: i == 0 ? kPrimaryColor : kSlightlyDarkBlue,
                    textColor: i == 0 ? null : const Color(0xff50566A),
                    fontSize: kRegularSize - 1,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                ),
                i == 0 ? const SizedBox(width: 10) : Container(),
              ],
            )
        ],
      ),
    );
  }
}

class _NFTAccountPageHeading extends StatelessWidget {
  const _NFTAccountPageHeading({
    Key? key,
    required this.isUpcoming,
  }) : super(key: key);

  final bool isUpcoming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: RichText(
        text: TextSpan(
          style: kSemiBoldStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize + 2,
          ),
          children: [
            const TextSpan(text: 'You have '),
            TextSpan(
              text: '2 ',
              style: kSemiBoldStyle.copyWith(
                color: kPrimaryColor,
                fontSize: kRegularSize + 2,
              ),
            ),
            TextSpan(text: isUpcoming ? 'upcoming events' : 'saved events')
          ],
        ),
      ),
    );
  }
}

class _NFTAccountPageTicketViewButtons extends StatelessWidget {
  const _NFTAccountPageTicketViewButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0 ? const SizedBox(width: 20) : Container(),
              SizedBox(
                width: 160,
                child: NFTButton(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  color: index == 0 ? kPrimaryColor : kSlightlyDarkBlue,
                  textColor: index == 0 ? null : const Color(0xff50566A),
                  fontSize: kRegularSize - 1,
                  fontWeight: index == 0 ? FontWeight.w600 : null,
                  text: index == 0
                      ? 'Something'
                      : index == 1
                          ? 'My Ticket'
                          : 'Saved Ticket',
                ),
              ),
              index == 2 ? const SizedBox(width: 20) : Container(),
            ],
          );
        },
      ),
    );
  }
}

class _NFTAccountPageDiv extends StatelessWidget {
  const _NFTAccountPageDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kSlightlyDarkBlue,
      height: 60,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}

class _NFTAccountPageUserDetails extends StatelessWidget {
  const _NFTAccountPageUserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: '15',
            subText: 'Posts',
          ),
        ),
        _NFTAccountPageVerticalDiv(),
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: '13',
            subText: 'Following',
          ),
        ),
        _NFTAccountPageVerticalDiv(),
        Expanded(
          flex: 3,
          child: _NFTAccountPageUserDetailsBlock(
            mainText: '20',
            subText: 'Followers',
          ),
        ),
      ],
    );
  }
}

class _NFTAccountPageVerticalDiv extends StatelessWidget {
  const _NFTAccountPageVerticalDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSlightlyDarkBlue,
      width: 1,
      height: 40,
    );
  }
}

class _NFTAccountPageUserDetailsBlock extends StatelessWidget {
  const _NFTAccountPageUserDetailsBlock({
    Key? key,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mainText,
          style: kRegularStyle.copyWith(
              color: Colors.white, fontSize: kRegularSize + 4),
        ),
        Text(
          subText,
          style: kRegularStyle.copyWith(
            color: Colors.white.withAlpha(100),
            fontSize: kRegularSize - 2,
          ),
        )
      ],
    );
  }
}

class _NFTAccountPageUser extends StatelessWidget {
  const _NFTAccountPageUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(flex: 18),
            Text(
              'Juan Dela Cruz',
              style: kSemiBoldStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize + 2,
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              'assets/icons/ic-edit.svg',
              color: kPrimaryColor,
              height: 20,
            ),
            const Spacer(flex: 15),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'juandelacruz@gmail.com',
          style: kRegularStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize - 2,
          ),
        ),
      ],
    );
  }
}

class _NFTAccountPageBanner extends StatelessWidget {
  const _NFTAccountPageBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(color: kPrimaryColor),
          Positioned(
            right: 20,
            bottom: 20,
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              'assets/icons/ic-settings.svg',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _NFTAccountPageAvatar extends StatelessWidget {
  const _NFTAccountPageAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      left: size.width / 2 - 40,
      top: 60,
      child: Image.asset(
        'assets/community/img-avatar-2@3x.png',
        height: 80,
        width: 80,
      ),
    );
  }
}
