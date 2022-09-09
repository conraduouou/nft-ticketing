import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/new_password_provider.dart';
import 'package:nft_ticketing/screens/dashboard/dashboard_container.dart';
import 'package:nft_ticketing/screens/landing/connect_wallet_page/connect_wallet_page.dart';
import 'package:provider/provider.dart';

class ImportSeedPage extends StatelessWidget {
  const ImportSeedPage({super.key});

  static const id = '${ConnectWalletPage.id}/import';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewPasswordProvider(),
      builder: (context, child) {
        final provider = context.read<NewPasswordProvider>();

        return Scaffold(
          backgroundColor: kDarkBlue,
          appBar: const NFTAppBar(title: 'Import from seed phrase'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 25),
                  const _NFTImportSeedPageCustomField(),
                  const SizedBox(height: 20),
                  NFTField(
                    initialText: provider.newPassword,
                    hintText: 'New password',
                    isObscurable: true,
                    onChanged: provider.onNewChange,
                  ),
                  Selector<NewPasswordProvider, int>(
                    selector: (c, p) => p.newPassword.length,
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        _NFTImportSeedPagePasswordStrength(),
                      ],
                    ),
                    builder: (_, length, child) {
                      if (length != 0) return child!;
                      return Container();
                    },
                  ),
                  const SizedBox(height: 20),
                  NFTField(
                    hintText: 'Confirm password',
                    isObscurable: true,
                    onChanged: provider.onConfirmChange,
                  ),
                  const SizedBox(height: 50),
                  NFTButton(
                    text: 'Import wallet',
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                            DashboardContainer.id, (_) => false),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NFTImportSeedPageCustomField extends StatefulWidget {
  const _NFTImportSeedPageCustomField({
    Key? key,
  }) : super(key: key);

  @override
  State<_NFTImportSeedPageCustomField> createState() =>
      _NFTImportSeedPageCustomFieldState();
}

class _NFTImportSeedPageCustomFieldState
    extends State<_NFTImportSeedPageCustomField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSlightlyDarkBlue,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              obscureText: _isObscured,
              maxLines: _isObscured ? 1 : 3,
              cursorColor: Colors.white,
              style: kRegularStyle.copyWith(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                hintText: 'Secret Recovery Phrase',
                hintStyle: kRegularStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
            child: Icon(
              _isObscured
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}

class _NFTImportSeedPagePasswordStrength extends StatelessWidget {
  const _NFTImportSeedPagePasswordStrength({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NewPasswordProvider>(
      builder: (_, provider, __) {
        final width = MediaQuery.of(context).size.width;
        final requirements = provider.requirements;
        final satisfiedReqs = requirements.where((e) => e.isSatisfied);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kSlightlyDarkBlue,
              ),
              alignment: Alignment.centerLeft,
              child: Container(
                width: satisfiedReqs.length == 1
                    ? width / 3
                    : satisfiedReqs.length == 2
                        ? width * 2 / 3
                        : satisfiedReqs.length == 3
                            ? width
                            : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password Strength',
                  style: kRegularStyle.copyWith(
                    color: Colors.white.withAlpha(120),
                    fontSize: kRegularSize - 6,
                  ),
                ),
                Text(
                  satisfiedReqs.length == 3
                      ? 'Strong'
                      : satisfiedReqs.length == 2
                          ? 'Moderately strong'
                          : satisfiedReqs.length == 1
                              ? 'Moderately weak'
                              : 'Weak',
                  style: kRegularStyle.copyWith(
                    color: Colors.green,
                    fontSize: kRegularSize - 6,
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
