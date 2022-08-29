import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/providers/account_page_provider.dart';
import 'package:nft_ticketing/screens/dashboard/ticket_view_page/ticket_view_page.dart';

class NFTAccountPageTicket extends StatelessWidget {
  const NFTAccountPageTicket({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
    this.dateView = TicketDate.upcoming,
  }) : super(key: key);

  final String eventTitle;
  final String eventDate;

  final TicketDate dateView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: _NFTAccountPageTicketContent(
                    eventTitle: eventTitle,
                    eventDate: eventDate,
                    dateView: dateView,
                  ),
                ),
                Container(
                  foregroundDecoration: dateView == TicketDate.pastTicket
                      ? const BoxDecoration(
                          color: Colors.grey,
                          backgroundBlendMode: BlendMode.saturation,
                        )
                      : null,
                  child: Image.asset(
                    'assets/homepage/img-happeningnow-1@2x-cropped.png',
                    width: 135,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: -6.5,
            bottom: 40,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: kDarkBlue,
                shape: BoxShape.circle,
                border: Border.all(color: kSecondaryColor, width: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NFTAccountPageTicketContent extends StatelessWidget {
  const _NFTAccountPageTicketContent({
    Key? key,
    required this.eventTitle,
    required this.eventDate,
    this.dateView = TicketDate.upcoming,
  }) : super(key: key);

  final String eventTitle;
  final String eventDate;

  final TicketDate dateView;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventTitle,
              style: kSemiBoldStyle.copyWith(
                color: dateView == TicketDate.upcoming
                    ? Colors.white
                    : Colors.white.withAlpha(100),
                fontSize: kRegularSize - 1,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              eventDate,
              style: kRegularStyle.copyWith(
                color: dateView == TicketDate.upcoming
                    ? Colors.white
                    : Colors.white.withAlpha(100),
                fontSize: kRegularSize - 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            TicketViewPage.id,
            arguments: {
              'eventTitle': eventTitle,
              'eventDate': eventDate,
              'dateView': dateView,
            },
          ),
          child: Text(
            'View ticket',
            style: kRegularStyle.copyWith(
              color: kPrimaryColor,
              fontSize: kRegularSize - 3,
            ),
          ),
        )
      ],
    );
  }
}
