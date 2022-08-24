import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/landing/forgot_password_page/forgot_password_page.dart';

class EnterCodePage extends StatelessWidget {
  const EnterCodePage({
    Key? key,
    required this.email,
  }) : super(key: key);

  static const id = '/${ForgotPasswordPage.id}/enter-code';
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: NFTAppBar(),
      body: Column(),
    );
  }
}
