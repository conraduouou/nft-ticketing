import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_checkbox.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  static const id = '/create-account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(title: 'Create an account'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 20),
            NFTField(hintText: 'Full name'),
            SizedBox(height: 20),
            NFTField(hintText: 'Email Address'),
            SizedBox(height: 20),
            NFTField(hintText: 'Mobile Number'),
            SizedBox(height: 30),
            _TermsAndConditions(),
            SizedBox(height: 50),
            NFTButton(text: 'Create account'),
            SizedBox(height: 30),
            _AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NFTCheckbox(
          value: false,
          onChanged: () {},
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: kRegularStyle.copyWith(fontSize: kRegularSize - 2),
            children: [
              const TextSpan(
                text: 'I agree to the ',
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Terms and Conditions',
                    style: kRegularStyle.copyWith(
                      fontSize: kRegularSize - 2,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _AlreadyHaveAccount extends StatelessWidget {
  const _AlreadyHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: kRegularStyle,
          children: [
            const TextSpan(text: 'Already have an account? '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 55,
                  child: Text(
                    'Sign in',
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
