import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_event_mini_block.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/user.dart';
import 'package:nft_ticketing/providers/account_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_banner_and_avatar.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_div.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_ticket.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_user.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_user_details.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
    this.userDetails,
  }) : super(key: key);

  static const id = '${DashboardContainer.id}/account';

  final User? userDetails;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountPageProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: kDarkBlue,
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  NFTAccountPageBannerAndAvatar(
                    assetPath: userDetails == null
                        ? 'assets/community/img-avatar-2@3x.png'
                        : userDetails!.imgPath,
                    showSettings: userDetails == null,
                    showBackButton: userDetails != null,
                  ),
                  const SizedBox(height: 65),
                  NFTAccountPageUser(
                    isSelf: userDetails == null,
                    name: userDetails == null
                        ? 'Juan dela Cruz'
                        : userDetails!.name,
                    email: userDetails == null
                        ? 'juandelacruz@gmail.com'
                        : userDetails!.email,
                  ),
                  userDetails != null
                      ? const SizedBox(height: 25)
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: NFTButton(
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.add_sharp,
                                    color: kPrimaryColor,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Follow',
                                  style: kRegularStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: kRegularSize - 2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: NFTButton(
                            text: 'Message',
                            padding: EdgeInsets.symmetric(vertical: 13),
                            fontSize: kRegularSize - 2,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  NFTAccountPageUserDetails(
                    posts: userDetails == null ? 11 : userDetails!.posts,
                    following:
                        userDetails == null ? 200 : userDetails!.following,
                    followers:
                        userDetails == null ? 400 : userDetails!.followers,
                  ),
                  const NFTAccountPageDiv(),
                  userDetails == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _NFTAccountPageTicketViewButtons(),
                            const SizedBox(height: 25),
                            Selector<AccountPageProvider, TicketView>(
                              selector: (c, p) => p.ticketView,
                              builder: (_, view, __) {
                                return Selector<AccountPageProvider,
                                    TicketDate>(
                                  selector: (c, p) => p.ticketDate,
                                  builder: (_, date, __) {
                                    return _NFTAccountPageHeading(
                                      ticketType: view == TicketView.myTicket
                                          ? date == TicketDate.upcoming
                                              ? date.name
                                              : 'past'
                                          : 'saved',
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 25),
                            Selector<AccountPageProvider, TicketView>(
                              selector: (c, p) => p.ticketView,
                              builder: (_, view, __) {
                                if (view == TicketView.myTicket) {
                                  return const _NFTAccountPageMyTicketView();
                                } else {
                                  return const _NFTAccountPageSavedTicketView();
                                }
                              },
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 40)
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NFTAccountPageTicketViewButtons extends StatelessWidget {
  const _NFTAccountPageTicketViewButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AccountPageProvider>();

    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: TicketView.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0 ? const SizedBox(width: 20) : Container(),
              SizedBox(
                width: 160,
                child: Selector<AccountPageProvider, TicketView>(
                  selector: (c, p) => p.ticketView,
                  builder: (_, view, __) {
                    return NFTButton(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      fontSize: kRegularSize - 1,
                      color: index == TicketView.values.indexOf(view)
                          ? kPrimaryColor
                          : kSlightlyDarkBlue,
                      textColor: index == TicketView.values.indexOf(view)
                          ? null
                          : const Color(0xff50566A),
                      fontWeight: index == TicketView.values.indexOf(view)
                          ? FontWeight.w600
                          : null,
                      text: TicketView.values.elementAt(index).name.titleCase,
                      onPressed: () => provider.ticketView =
                          TicketView.values.elementAt(index),
                    );
                  },
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

class _NFTAccountPageHeading extends StatelessWidget {
  const _NFTAccountPageHeading({
    Key? key,
    required this.ticketType,
  }) : super(key: key);

  final String ticketType;

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
            TextSpan(text: '$ticketType events')
          ],
        ),
      ),
    );
  }
}

class _NFTAccountPageMyTicketView extends StatelessWidget {
  const _NFTAccountPageMyTicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _NFTAccountPageDateViewButtons(),
        const SizedBox(height: 30),
        for (int i = 0; i < 2; i++)
          Column(
            children: [
              NFTAccountPageTicket(
                eventTitle: i == 0 ? 'Innings Festival' : 'High Water',
                eventDate: i == 0 ? 'March 19-March 20' : 'April 23 & 24',
              ),
              i != 1 ? const SizedBox(height: 20) : Container(),
            ],
          ),
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

class _NFTAccountPageSavedTicketView extends StatelessWidget {
  const _NFTAccountPageSavedTicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          for (int i = 0; i < 3; i += 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int j = i; j < (i + 2 > 3 ? 3 : i + 2); j++)
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width / 2.32),
                    child: const NFTEventMiniBlock(
                      assetPath: 'assets/homepage/img-happeningnow-1@2x.png',
                      eventTitle: 'Innings Festival',
                    ),
                  )
              ],
            )
        ],
      ),
    );
  }
}
