import 'package:flutter/material.dart';
import 'package:nft_ticketing/nft_ticketing_app.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(NFTTicketingApp());
}
