import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const id = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: kSemiBoldStyle.copyWith(
                      color: Colors.white,
                      fontSize: kLargeSize - 6,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enter your email or phone number',
                    style: kRegularStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const NFTField(hintText: 'Email address'),
            const SizedBox(height: 40),
            const NFTButton(text: 'Send code'),
          ],
        ),
      ),
    );
  }
}
