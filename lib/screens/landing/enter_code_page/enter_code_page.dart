import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/enter_code_provider.dart';
import 'package:nft_ticketing/screens/landing/forgot_password_page/forgot_password_page.dart';
import 'package:nft_ticketing/screens/landing/new_password_page/new_password_page.dart';
import 'package:provider/provider.dart';

class EnterCodePage extends StatelessWidget {
  const EnterCodePage({
    Key? key,
    required this.email,
  }) : super(key: key);

  static const id = '${ForgotPasswordPage.id}/enter-code';
  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EnterCodeProvider(),
      builder: (ctx, _) {
        final provider = ctx.read<EnterCodeProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          appBar: const NFTAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                _Instructions(email: email),
                const SizedBox(height: 40),
                _CodeFields(provider: provider),
                const SizedBox(height: 50),
                NFTButton(
                  text: 'Confirm',
                  onPressed: () {
                    Navigator.of(context).pushNamed(NewPasswordPage.id);
                  },
                ),
                const SizedBox(height: 30),
                const _ResendText(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter your code',
            style: kSemiBoldStyle.copyWith(
              color: Colors.white,
              fontSize: kLargeSize - 6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Enter the 4-digit PIN we\'ve sent to\n' '$email',
            softWrap: true,
            textAlign: TextAlign.center,
            style: kRegularStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeFields extends StatelessWidget {
  const _CodeFields({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final EnterCodeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 4; i++)
          Row(
            children: [
              NFTField(
                width: 60,
                textAlign: TextAlign.center,
                isDigitsOnly: true,
                maxLength: 1,
                padding: const EdgeInsets.symmetric(vertical: 15),
                fontSize: kLargeSize - 6,
                isClearable: false,
                onChanged: (s) {
                  if (i != 3) {
                    if (s.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  }

                  provider.onCodeChange(i, s);
                },
              ),
              i < 3 ? const SizedBox(width: 20) : Container()
            ],
          ),
      ],
    );
  }
}

class _ResendText extends StatelessWidget {
  const _ResendText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: kRegularStyle.copyWith(color: Colors.white),
          children: [
            const TextSpan(text: 'Didn\'t get the code? '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {}, // resend operation here
                child: SizedBox(
                  width: 60,
                  child: Text(
                    'Resend',
                    style: kSemiBoldStyle.copyWith(
                      color: kPrimaryColor,
                    ),
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
