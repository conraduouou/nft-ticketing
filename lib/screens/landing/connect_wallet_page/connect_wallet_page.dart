import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';

class ConnectWalletPage extends StatelessWidget {
  const ConnectWalletPage({super.key});

  static const id = '${LoginPage.id}/connect-wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(title: 'Connect Wallet'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),
            const _NFTConnectWalletPageHeading(),
            const Spacer(),
            Text(
              'Import an existing wallet or create a new one',
              textAlign: TextAlign.center,
              style: kRegularStyle.copyWith(
                color: Colors.white,
                fontSize: kRegularSize - 1,
              ),
            ),
            const SizedBox(height: 30),
            NFTButton(
              color: Colors.white,
              textColor: kDarkBlue,
              text: 'Import using recovery phrase',
              padding: const EdgeInsets.symmetric(vertical: 20),
              onPressed: () => Navigator.of(context).pushNamed(routeName),
            ),
            const SizedBox(height: 25),
            const NFTButton(
              text: 'Create a new wallet',
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            const SizedBox(height: 30),
            Text(
              'Skip for now',
              textAlign: TextAlign.center,
              style: kRegularStyle.copyWith(
                color: Colors.white.withAlpha(120),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

class _NFTConnectWalletPageHeading extends StatelessWidget {
  const _NFTConnectWalletPageHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/community/img-avatar-2@3x.png',
          width: 80,
          height: 80,
        ),
        const SizedBox(width: 20),
        const _NFTConnectWalletPageCircle(
          color: Color.fromARGB(255, 28, 30, 41),
        ),
        const SizedBox(width: 10),
        const _NFTConnectWalletPageCircle(
          color: Color.fromARGB(255, 46, 49, 66),
        ),
        const SizedBox(width: 10),
        const _NFTConnectWalletPageCircle(
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            color: kSecondaryColor,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}

class _NFTConnectWalletPageCircle extends StatelessWidget {
  const _NFTConnectWalletPageCircle({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
