import 'package:flutter/material.dart';

class AccountPageProvider with ChangeNotifier {
  TicketView _ticketView = TicketView.myNFTs;
  TicketDate _ticketDate = TicketDate.upcoming;

  TicketView get ticketView => _ticketView;
  TicketDate get ticketDate => _ticketDate;

  set ticketView(TicketView view) {
    _ticketView = view;
    notifyListeners();
  }

  set ticketDate(TicketDate date) {
    _ticketDate = date;
    notifyListeners();
  }
}

enum TicketView { myNFTs, myTicket, savedTicket }

enum TicketDate { upcoming, pastTicket }
