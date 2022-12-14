import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_event_mini_block.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/models/core/user.dart';
import 'package:nft_ticketing/providers/account_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_banner_and_avatar.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_ticket.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/components/nft_account_page_user.dart';
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
                  userDetails != null
                      ? const _NFTAccountPageFollowMessageButtons()
                      : Container(),
                  const SizedBox(height: 40),
                  /*
                  NFTAccountPageUserDetails(
                    posts: userDetails == null ? 11 : userDetails!.posts,
                    following:
                        userDetails == null ? 200 : userDetails!.following,
                    followers:
                        userDetails == null ? 400 : userDetails!.followers,
                  ),
                  */
                ]),
              ),
              userDetails == null
                  ? const _NFTAccountPageSelfViewHeading()
                  : SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          'NFTs',
                          style: kRegularStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
              userDetails == null
                  ? Selector<AccountPageProvider, TicketView>(
                      selector: (_, p) => p.ticketView,
                      builder: (_, view, __) {
                        if (view == TicketView.myTicket) {
                          return const _NFTAccountPageMyTicketView();
                        } else {
                          return _NFTAccountPageGridBodyView(
                            isNFTs: view == TicketView.myNFTs,
                          );
                        }
                      },
                    )
                  : const _NFTAccountPageOthersView(),
              const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
            ],
          ),
        );
      },
    );
  }
}

class _NFTAccountPageFollowMessageButtons extends StatelessWidget {
  const _NFTAccountPageFollowMessageButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class _NFTAccountPageOthersView extends StatelessWidget {
  const _NFTAccountPageOthersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        childAspectRatio: size.width / max(850, size.height) * 1.45,
        crossAxisSpacing: 10,
        children: [
          for (int i = 0; i < 4; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: size.width / 2),
                  child: Image.asset(
                    'assets/other_user/img-users-nft-${i + 1}@2x.png', // replace with dynamic argument in the future
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kSlightlyDarkBlue,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Block #8659',
                  style: kRegularStyle.copyWith(
                    color: Colors.white,
                    fontSize: kRegularSize - 2,
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}

class _NFTAccountPageSelfViewHeading extends StatelessWidget {
  const _NFTAccountPageSelfViewHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _NFTAccountPageTicketViewButtons(),
          const SizedBox(height: 25),
          Selector<AccountPageProvider, TicketView>(
            selector: (c, p) => p.ticketView,
            builder: (_, view, __) {
              return Selector<AccountPageProvider, TicketDate>(
                selector: (c, p) => p.ticketDate,
                builder: (_, date, __) {
                  return _NFTAccountPageHeading(
                    ticketType: view == TicketView.myTicket
                        ? date == TicketDate.upcoming
                            ? '${date.name} events'
                            : 'past events'
                        : view == TicketView.myNFTs
                            ? 'NFTs'
                            : 'saved events',
                  );
                },
              );
            },
          ),
          const SizedBox(height: 25),
        ],
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
                      text: index == 0
                          ? 'My NFTs'
                          : TicketView.values.elementAt(index).name.titleCase,
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
            TextSpan(text: ticketType)
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
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _NFTAccountPageDateViewButtons(),
          const SizedBox(height: 30),
          for (int i = 0; i < 2; i++)
            Selector<AccountPageProvider, TicketDate>(
                selector: (_, p) => p.ticketDate,
                builder: (_, date, __) {
                  return Column(
                    children: [
                      NFTAccountPageTicket(
                        imgPath:
                            'assets/homepage/img-happeningnow-${i + 1}@2x.png',
                        eventTitle: i == 0 ? 'Innings Festival' : 'High Water',
                        eventDate:
                            i == 0 ? 'March 19-March 20' : 'April 23 & 24',
                        dateView: date,
                      ),
                      i != 1 ? const SizedBox(height: 20) : Container(),
                    ],
                  );
                }),
        ],
      ),
    );
  }
}

class _NFTAccountPageDateViewButtons extends StatelessWidget {
  const _NFTAccountPageDateViewButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AccountPageProvider>();

    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 35,
      child: Row(
        children: [
          for (int i = 0; i < TicketDate.values.length; i++)
            Row(
              children: [
                Selector<AccountPageProvider, TicketDate>(
                  selector: (_, p) => p.ticketDate,
                  builder: (_, date, __) {
                    return SizedBox(
                      width: 120,
                      child: NFTButton(
                        fontSize: kRegularSize - 1,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        text: TicketDate.values[i].name.titleCase,
                        fontWeight: TicketDate.values[i] == date
                            ? FontWeight.w600
                            : null,
                        color: TicketDate.values[i] == date
                            ? kPrimaryColor
                            : kSlightlyDarkBlue,
                        textColor: TicketDate.values[i] == date
                            ? null
                            : const Color(0xff50566A),
                        onPressed: () {
                          provider.ticketDate = TicketDate.values[i];
                        },
                      ),
                    );
                  },
                ),
                i == 0 ? const SizedBox(width: 10) : Container(),
              ],
            )
        ],
      ),
    );
  }
}

class _NFTAccountPageGridBodyView extends StatelessWidget {
  const _NFTAccountPageGridBodyView({
    Key? key,
    this.isNFTs = false,
  }) : super(key: key);

  final bool isNFTs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final assetPaths = List.generate(
      3,
      (i) => isNFTs
          ? 'assets/nfts/img-nft-${i + 1}.png'
          : 'assets/homepage/img-${i != 2 ? 'happeningnow' : 'comingsoon'}'
              '-${i != 2 ? i + 1 : 1}@2x.png',
    );

    final titles = List.generate(
      3,
      (i) => isNFTs
          ? i == 0
              ? 'Slotie NFT #004'
              : i == 1
                  ? 'Metroverse #013'
                  : 'Troverse #001'
          : i == 0
              ? 'Innings Festival'
              : i == 1
                  ? 'Lost Lands'
                  : 'High Water',
    );

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: size.width / max(850, size.height) * 1.75,
        children: [
          for (int i = 0; i < 3; i++)
            NFTEventMiniBlock(
              constraints:
                  BoxConstraints(maxWidth: size.width / 2 - 20, maxHeight: 150),
              assetPath: assetPaths[i],
              eventTitle: titles[i],
              hasBottomPadding: false,
            ),
        ],
      ),
    );
  }
}
