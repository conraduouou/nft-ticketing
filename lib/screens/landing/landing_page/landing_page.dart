import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/landing/create_page/create_page.dart';

// Body
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Stack(
        children: const [
          _Logo(),
          _LandingButtons(),
        ],
      ),
    );
  }
}

class _Logo extends StatefulWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  State<_Logo> createState() => _LogoState();
}

class _LogoState extends State<_Logo> {
  static const duration = Duration(milliseconds: 1000);
  double scale = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        scale = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: size.height / 2.25,
      child: AnimatedScale(
        curve: Curves.easeOutBack,
        duration: duration,
        scale: scale,
        child: SizedBox(
          width: size.width,
          child: Center(
            child: Text(
              'NFT Tiktyn',
              style: kSemiBoldStyle.copyWith(
                fontSize: kLargeSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LandingButtons extends StatefulWidget {
  const _LandingButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<_LandingButtons> createState() => _LandingButtonsState();
}

class _LandingButtonsState extends State<_LandingButtons> {
  static const duration = Duration(milliseconds: 1000);
  double bottom = -100;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        bottom = 50;
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: bottom,
      curve: Curves.easeOutBack,
      duration: duration,
      width: MediaQuery.of(context).size.width,
      child: AnimatedOpacity(
        duration: duration,
        opacity: opacity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const NFTButton(text: 'Sign in', fontSize: kRegularSize + 1),
              const SizedBox(height: 20),
              NFTButton(
                text: 'Create account',
                color: kSecondaryColor,
                fontSize: kRegularSize + 1,
                onPressed: () => Navigator.of(context).pushNamed(CreatePage.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
