import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/forgot_page_provider.dart';
import 'package:nft_ticketing/screens/landing/enter_code_page/enter_code_page.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const id = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPageProvider(),
      builder: (ctx, _) {
        final provider = ctx.read<ForgotPageProvider>();

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
                NFTField(
                  hintText: 'Email address',
                  onChanged: provider.onEmailChange,
                ),
                const SizedBox(height: 40),
                Selector<ForgotPageProvider, bool>(
                  selector: (ctx, p) => p.email.isNotEmpty,
                  builder: (ctx, isNotEmpty, __) {
                    return NFTButton(
                      text: 'Send code',
                      color: isNotEmpty ? kPrimaryColor : kSecondaryColor,
                      onPressed: isNotEmpty
                          ? () {
                              Navigator.pushNamed(
                                context,
                                EnterCodePage.id,
                                arguments: provider.email,
                              );
                            }
                          : () {},
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
