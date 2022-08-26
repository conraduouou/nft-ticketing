import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_appbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/transaction_history/transaction_history.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({
    Key? key,
    required this.ticketNo,
  }) : super(key: key);

  static const id = '${TransactionHistoryPage.id}/transaction';

  final int ticketNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: const NFTAppBar(
        title: 'Transaction Details',
        showDivider: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Your purchased event ticket #${ticketNo + 1}',
              style: kSemiBoldStyle.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _NFTTransactionDetailsCard(
            items: {'Amount': '\$30'},
            isSemiBold: true,
          ),
          const SizedBox(height: 10),
          const _NFTTransactionDetailsCard(
            items: {
              'Transaction ID': '00293485',
              'Date and Time': 'May 11, 2022 - 2:00PM',
            },
          ),
        ],
      ),
    );
  }
}

class _NFTTransactionDetailsCard extends StatelessWidget {
  const _NFTTransactionDetailsCard({
    Key? key,
    required this.items,
    this.isSemiBold = false,
  }) : super(key: key);

  final Map<String, String> items;
  final bool isSemiBold;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSlightlyDarkBlue,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++)
            Padding(
              padding: EdgeInsets.only(bottom: i != items.length - 1 ? 8 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items.keys.elementAt(i),
                    style: kRegularStyle.copyWith(
                      color: Colors.white.withAlpha(100),
                      fontSize: kRegularSize - 2,
                    ),
                  ),
                  Text(
                    items.values.elementAt(i),
                    style: kRegularStyle.copyWith(
                      color: Colors.white,
                      fontWeight: isSemiBold ? FontWeight.w600 : null,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
