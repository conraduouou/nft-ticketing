import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/login_page_provider.dart';
import 'package:nft_ticketing/screens/home/dashboard_container.dart';
import 'package:nft_ticketing/screens/landing/forgot_password_page/forgot_password_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const id = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageProvider(),
      builder: (ctx, _) {
        final provider = ctx.read<LoginPageProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          appBar: const NFTAppBar(title: 'Sign in'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'Email address',
                  onChanged: provider.onEmailChange,
                ),
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'Password',
                  onChanged: provider.onPasswordChange,
                  isObscurable: true,
                ),
                const SizedBox(height: 50),
                Selector<LoginPageProvider, bool>(
                  selector: (ctx, p) => p.isAllFilled,
                  builder: (_, isAllFilled, __) {
                    return NFTButton(
                      text: 'Sign in',
                      color: isAllFilled ? kPrimaryColor : kSecondaryColor,
                      onPressed: isAllFilled
                          ? () => Navigator.of(context)
                              .pushNamed(DashboardContainer.id)
                          : null,
                    );
                  },
                ),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, ForgotPasswordPage.id),
                    child: Text(
                      'Forgot password?',
                      style: kRegularStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
