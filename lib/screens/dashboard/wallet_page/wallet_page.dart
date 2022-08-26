import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  static const id = '${DashboardContainer.id}/wallet';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkBlue,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              _NFTWalletPageHeadingSection(),
              _NFTWalletPageDiv(),
              _NFTWalletPageTransactionSection(),
              SizedBox(height: 30)
            ]),
          ),
        ],
      ),
    );
  }
}

class _NFTWalletPageHeadingSection extends StatelessWidget {
  const _NFTWalletPageHeadingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Wallet',
                style: kSemiBoldStyle.copyWith(
                  color: Colors.white,
                  fontSize: kRegularSize + 2,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/ic-signout.svg',
              )
            ],
          ),
          const SizedBox(height: 20),
          const _NFTWalletPageBalanceCard(),
          const SizedBox(height: 30),
          const _NFTWalletPageCodeCard(),
        ],
      ),
    );
  }
}

class _NFTWalletPageBalanceCard extends StatelessWidget {
  const _NFTWalletPageBalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Balance',
            style: kRegularStyle.copyWith(
              color: Colors.white.withAlpha(100),
              fontSize: kRegularSize - 2,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$10,234',
            style: kSemiBoldStyle.copyWith(
              color: Colors.white,
              fontSize: kLargeSize + 2,
            ),
          ),
          const SizedBox(height: 60),
          Text(
            'Last transaction: May 11, 2022',
            style: kRegularStyle.copyWith(
              color: Colors.white.withAlpha(100),
              fontSize: kRegularSize - 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _NFTWalletPageCodeCard extends StatelessWidget {
  const _NFTWalletPageCodeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Clipboard.setData(const ClipboardData(text: 'Ob2A106P2Lx3AmMsdGF21'));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Added to clipboard'),
            duration: const Duration(milliseconds: 1500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: kSlightlyDarkBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/ic-copy.svg'),
            const SizedBox(width: 10),
            Text(
              'Ob2A106P2Lx3AmMsdGF21',
              style: kRegularStyle.copyWith(
                fontSize: kRegularSize - 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NFTWalletPageTransactionSection extends StatelessWidget {
  const _NFTWalletPageTransactionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction History',
                style: kSemiBoldStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'View all (3)', // replace with dynamic int
                style: kRegularStyle.copyWith(
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          for (int i = 0; i < 3; i++)
            Column(
              children: [
                _NFTWalletPageTransactionCard(i: i),
                i != 2 ? const SizedBox(height: 15) : Container(),
              ],
            ),
        ],
      ),
    );
  }
}

class _NFTWalletPageTransactionCard extends StatelessWidget {
  const _NFTWalletPageTransactionCard({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: kSlightlyDarkBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/ic-transaction-history.svg',
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your purchase event ticket # ${i + 1}',
                style: kRegularStyle.copyWith(
                  color: Colors.white,
                  fontSize: kRegularSize - 4,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'May 11, 2022 - 2:00PM',
                style: kRegularStyle.copyWith(
                  color: Colors.white.withAlpha(100),
                  fontSize: kRegularSize - 6,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '\$30',
                style: kSemiBoldStyle.copyWith(
                  fontSize: kRegularSize - 4,
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _NFTWalletPageDiv extends StatelessWidget {
  const _NFTWalletPageDiv({
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
