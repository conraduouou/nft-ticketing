import 'package:flutter/material.dart';

class AccountPageProvider with ChangeNotifier {
  TicketView _ticketView = TicketView.myTicket;
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

enum TicketView { myTicket, savedTicket }

enum TicketDate { upcoming, pastTicket }
