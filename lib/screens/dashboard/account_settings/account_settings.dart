import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/components/nft_account_information.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  static const id = '${AccountPage.id}/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(
        title: 'Edit Profile',
        showDivider: true,
        height: kToolbarHeight + 30,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const _NFTAccountSettingsAvatar(),
              const SizedBox(height: 10),
              Text(
                'Update picture',
                textAlign: TextAlign.center,
                style: kRegularStyle.copyWith(
                  color: kPrimaryColor,
                  fontSize: kRegularSize - 2,
                ),
              ),
              const _NFTAccountSettingsDiv(),
              const NFTAccountInformation(),
              const _NFTAccountSettingsDiv(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Klaytn Wallet Information',
                    style: kSemiBoldStyle.copyWith(
                      color: Colors.white,
                      fontSize: kRegularSize + 2,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: kSlightlyDarkBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const NFTField(
                    initialText: 'juandelacruz@gmail.com',
                    hintText: 'Email',
                  ),
                ],
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}

class _NFTAccountSettingsAvatar extends StatelessWidget {
  const _NFTAccountSettingsAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kSecondaryColor, width: 1),
      ),
      child: SvgPicture.asset(
        'assets/icons/ic-take-a-picture.svg',
        color: Colors.white,
      ),
    );
  }
}

class _NFTAccountSettingsDiv extends StatelessWidget {
  const _NFTAccountSettingsDiv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kSlightlyDarkBlue,
      height: 60,
      thickness: 1,
    );
  }
}
