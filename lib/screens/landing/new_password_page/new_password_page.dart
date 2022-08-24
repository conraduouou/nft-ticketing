import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/new_password_provider.dart';
import 'package:nft_ticketing/screens/landing/enter_code_page/enter_code_page.dart';
import 'package:nft_ticketing/screens/landing/landing_page/landing_page.dart';
import 'package:nft_ticketing/screens/landing/login_page/login_page.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  static const id = '${EnterCodePage.id}/create-new-password';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewPasswordProvider(),
      builder: (ctx, __) {
        final provider = ctx.read<NewPasswordProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          appBar: const NFTAppBar(
            title: 'Create new password',
            showLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'New password',
                  isObscurable: true,
                  onChanged: provider.onNewChange,
                ),
                const SizedBox(height: 20),
                NFTField(
                  hintText: 'Confirm password',
                  isObscurable: true,
                  onChanged: provider.onConfirmChange,
                ),
                const SizedBox(height: 30),
                const _ReqLines(),
                const SizedBox(height: 50),
                Selector<NewPasswordProvider, bool>(
                  selector: (ctx, p) => p.isAllFilled && p.isAllSatisfied,
                  builder: (ctx, isAllFilled, __) {
                    return NFTButton(
                      text: 'Create password',
                      color: isAllFilled ? kPrimaryColor : kSecondaryColor,
                      onPressed: () {
                        showDialog(
                          barrierColor: const Color.fromARGB(80, 144, 150, 172),
                          context: context,
                          builder: (_) {
                            return NFTDialog(
                              onPressed: () {
                                // navigate to login page
                                Navigator.of(ctx, rootNavigator: true).pop();
                                final navigator = Navigator.of(context);
                                navigator.popUntil(
                                  ModalRoute.withName(LandingPage.id),
                                );
                                navigator.pushNamed(LoginPage.id);
                              },
                            );
                          },
                        );
                      },
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

class NFTDialog extends StatelessWidget {
  const NFTDialog({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  /// The operation to be done upon pressing the button in this `Dialog`.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: kSlightlyDarkBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: SizedBox(
          width: 350,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                'Success!',
                style: kBoldStyle.copyWith(
                  fontSize: kLargeSize - 2,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'You have created your new password.',
                style: kRegularStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              NFTButton(
                text: 'Go to sign in',
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                onPressed: onPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReqLines extends StatelessWidget {
  const _ReqLines({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NewPasswordProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < provider.requirements.length; i++)
          Selector<NewPasswordProvider, bool>(
            selector: (ctx, p) => p.requirements[i].isSatisfied,
            child: const SizedBox(height: 15),
            builder: (_, isSatisfied, child) {
              return Column(
                children: [
                  _ReqLine(
                    isSatisfied: isSatisfied,
                    text: provider.requirements[i].text,
                  ),
                  child!,
                ],
              );
            },
          ),
      ],
    );
  }
}

class _ReqLine extends StatelessWidget {
  const _ReqLine({
    Key? key,
    required this.isSatisfied,
    required this.text,
  }) : super(key: key);

  final bool isSatisfied;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isSatisfied ? Icons.check_circle_rounded : Icons.circle_outlined,
          color: isSatisfied ? const Color(0xFF2ECC71) : Colors.white,
          size: kRegularSize + 2,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Open Sans',
          ),
        ),
      ],
    );
  }
}
