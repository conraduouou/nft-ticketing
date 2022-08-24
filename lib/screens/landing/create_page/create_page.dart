import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_checkbox.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/create_page_provider.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  static const id = '/create-account';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CreatePageProvider(),
      builder: (ctx, child) {
        final provider = ctx.read<CreatePageProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          appBar: const NFTAppBar(title: 'Create an account'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'Full name',
                  onChanged: provider.onNameChange,
                  onClear: () {
                    provider.onNameChange('');
                  },
                ),
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'Email Address',
                  onChanged: provider.onEmailChange,
                  onClear: () {
                    provider.onEmailChange('');
                  },
                ),
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'Mobile Number',
                  onChanged: provider.onMobileChange,
                  onClear: () {
                    provider.onMobileChange('');
                  },
                ),
                const SizedBox(height: 30),
                const _TermsAndConditions(),
                const SizedBox(height: 50),
                Selector<CreatePageProvider, bool>(
                  selector: (ctx, p) => p.isAllFilled,
                  builder: (_, isAllFilled, __) {
                    return NFTButton(
                      text: 'Create account',
                      color: isAllFilled ? kPrimaryColor : kSecondaryColor,
                    );
                  },
                ),
                const SizedBox(height: 30),
                const _AlreadyHaveAccount(),
              ],
            ),
          ),
        );
      },
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
        Selector<CreatePageProvider, bool>(
          selector: (ctx, p) => p.isAgreed,
          builder: (_, isAgreed, __) {
            return NFTCheckbox(
              value: isAgreed,
              onChanged: context.read<CreatePageProvider>().toggleAgreed,
            );
          },
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
                onTap: () => Navigator.popAndPushNamed(context, LoginPage.id),
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
