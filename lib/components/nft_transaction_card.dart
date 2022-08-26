import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/transaction_details/transaction_details.dart';

class NFTTransactionCard extends StatelessWidget {
  const NFTTransactionCard({
    Key? key,
    required this.ticketNo,
  }) : super(key: key);

  // supply more values in the future
  final int ticketNo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: () => Navigator.of(context).pushNamed(
        TransactionDetailsPage.id,
        arguments: ticketNo,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: kSlightlyDarkBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/ic-transaction-history.svg',
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your purchase event ticket # ${ticketNo + 1}',
                  style: kRegularStyle.copyWith(
                    color: Colors.white,
                    fontSize: kRegularSize - 4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'May 11, 2022 - 2:00PM',
                  style: kRegularStyle.copyWith(
                    color: Colors.white.withAlpha(100),
                    fontSize: kRegularSize - 6,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '\$30',
                  style: kSemiBoldStyle.copyWith(
                    fontSize: kRegularSize - 4,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
