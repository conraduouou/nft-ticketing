import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/landing/create_account_page/create_account_page.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';

// Body
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Stack(
        fit: StackFit.expand,
        children: const [
          _LandingGif(),
          _Logo(),
          _LandingButtons(),
        ],
      ),
    );
  }
}

class _LandingGif extends StatelessWidget {
  const _LandingGif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.width / 1.57;
    final width = (height * 0.55);

    return Stack(
      children: [
        // middle top right piece
        _LandingGifPiece(
          angle: -(pi / 1.489),
          startTop: -(size.width / 2.34),
          top: -(size.width / 5.67),
          startRight: -(size.width / 18.97),
          right: size.width / 4.89,
          reverseGradient: true,
          height: height,
          width: width,
        ),
        // bottom left piece
        _LandingGifPiece(
          angle: pi / 3,
          startTop: size.width / 1.92,
          top: size.width / 2,
          startLeft: -(size.width / 18),
          left: size.width / 15,
          height: height,
          width: width,
        ),
        // bottom right piece
        _LandingGifPiece(
          angle: -(pi / 1.45),
          top: size.width / 7.12,
          startRight: -(size.width / 4.89),
          right: size.width / 150,
          height: height,
          width: width,
        ),
        // middle left piece
        _LandingGifPiece(
          angle: pi / 1.2,
          startTop: -(size.width / 5),
          startLeft: -(size.width / 30),
          top: -(size.width / 18),
          left: size.width / 60,
          height: height,
          width: width,
        ),
        // top most piece
        _LandingGifPiece(
          angle: -(pi / 1.5),
          startTop: -(size.width / 1.45),
          top: -(size.width / 1.97),
          startRight: size.width / 90,
          right: size.width / 2.8,
          height: height,
          width: width,
        ),
      ],
    );
  }
}

class _LandingGifPiece extends StatefulWidget {
  const _LandingGifPiece({
    Key? key,
    required this.angle,
    this.reverseGradient = false,
    this.top,
    // ignore: unused_element
    this.bottom,
    this.right,
    this.left,
    this.startTop,
    // ignore: unused_element
    this.startBottom,
    this.startLeft,
    this.startRight,
    this.height,
    // ignore: unused_element
    this.width,
  }) : super(key: key);

  final double angle;
  final bool reverseGradient;

  final double? startTop;
  final double? startBottom;
  final double? startLeft;
  final double? startRight;

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  final double? height;
  final double? width;

  @override
  State<_LandingGifPiece> createState() => _LandingGifPieceState();
}

class _LandingGifPieceState extends State<_LandingGifPiece>
    with SingleTickerProviderStateMixin {
  // late final AnimationController _controller;
  // late final Animation _animation;

  final _gradientColors = [
    const Color.fromARGB(255, 38, 72, 207),
    const Color.fromARGB(255, 39, 66, 175),
    const Color.fromARGB(255, 16, 31, 91),
    kDarkBlue,
    kDarkBlue,
  ];

  double? _top;
  double? _bottom;
  double? _left;
  double? _right;

  double? _height;
  double? _width;

  @override
  void initState() {
    _top = widget.top != null
        ? widget.startTop ?? (widget.top != null ? 0 : null)
        : null;
    _bottom = widget.bottom != null
        ? widget.startBottom ?? (widget.bottom != null ? 0 : null)
        : null;
    _left = widget.left != null
        ? widget.startLeft ?? (widget.left != null ? 0 : null)
        : null;
    _right = widget.right != null
        ? widget.startRight ?? (widget.right != null ? 0 : null)
        : null;

    _height = widget.height ?? 220;
    _width = widget.width ?? 120;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _top = widget.top;
        _left = widget.left;
        _bottom = widget.bottom;
        _right = widget.right;
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant _LandingGifPiece oldWidget) {
    _top = widget.top;
    _bottom = widget.bottom;
    _left = widget.left;
    _right = widget.right;

    _height = widget.height ?? 220;
    _width = widget.width ?? 120;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutBack,
      top: _top,
      bottom: _bottom,
      left: _left,
      right: _right,
      child: Transform.rotate(
        angle: widget.angle,
        child: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.reverseGradient
                  ? _gradientColors.reversed.toList()
                  : _gradientColors,
            ),
          ),
        ),
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
  static const duration = Duration(milliseconds: 900);
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
      bottom: size.height / 2.8,
      child: AnimatedScale(
        curve: Curves.easeOutBack,
        duration: duration,
        scale: scale,
        child: SizedBox(
          width: size.width,
          child: Center(
            child: SvgPicture.asset('assets/logo.svg'),
            // Text(
            //   'NFT Tiktyn',
            //   style: kSemiBoldStyle.copyWith(
            //     fontSize: kLargeSize,
            //     color: Colors.white,
            //   ),
            // ),
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
  static const duration = Duration(milliseconds: 900);
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
              NFTButton(
                text: 'Sign in',
                fontSize: kRegularSize + 1,
                onPressed: () => Navigator.of(context).pushNamed(LoginPage.id),
              ),
              const SizedBox(height: 20),
              NFTButton(
                text: 'Create account',
                color: kSecondaryColor,
                fontSize: kRegularSize + 1,
                onPressed: () =>
                    Navigator.of(context).pushNamed(CreateAccountPage.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
