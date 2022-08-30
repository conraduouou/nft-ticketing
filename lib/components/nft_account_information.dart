import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/landing/new_password_page/new_password_page.dart';

class NFTAccountInformation extends StatelessWidget {
  const NFTAccountInformation({
    Key? key,
    this.headingText,
    this.showPasswordField = true,
  }) : super(key: key);

  final String? headingText;
  final bool showPasswordField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingText ?? 'Account Information',
          style: kSemiBoldStyle.copyWith(
            color: Colors.white,
            fontSize: kRegularSize + 2,
          ),
        ),
        const SizedBox(height: 30),
        const NFTField(
          initialText: 'Juan Dela Cruz',
          hintText: 'Name',
        ),
        const SizedBox(height: 20),
        const NFTField(
          initialText: 'juandelacruz@gmail.com',
          hintText: 'Email',
        ),
        const SizedBox(height: 20),
        const NFTField(
          initialText: '09285244123',
          hintText: 'Mobile number',
        ),
        showPasswordField ? const SizedBox(height: 20) : Container(),
        showPasswordField
            ? const NFTField(
                enabled: false,
                showSuffix: false,
                isObscurable: true,
                initialText: 'something',
                hintText: 'Password',
              )
            : Container(),
        const SizedBox(height: 15),
        showPasswordField
            ? InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.of(context).pushNamed(
                  NewPasswordPage.id,
                  arguments: {
                    'showLeading': true,
                    'isUpdate': true,
                  },
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Update password',
                      style: kRegularStyle.copyWith(
                        color: kPrimaryColor,
                        fontSize: kRegularSize - 2,
                      ),
                    )
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
