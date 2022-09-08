import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/components/nft_button.dart';
import 'package:nft_ticketing/components/nft_field.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/landing/connect_wallet_page/connect_wallet_page.dart';

class ImportSeedPage extends StatelessWidget {
  const ImportSeedPage({super.key});

  static const id = '${ConnectWalletPage.id}/import';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(title: 'Import from seed phrase'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 25),
            _NFTImportSeedPageCustomField(),
            SizedBox(height: 20),
            NFTField(isObscurable: true, hintText: 'New password'),
            SizedBox(height: 20),
            NFTField(isObscurable: true, hintText: 'Confirm password'),
            SizedBox(height: 50),
            NFTButton(text: 'Import wallet')
          ],
        ),
      ),
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
