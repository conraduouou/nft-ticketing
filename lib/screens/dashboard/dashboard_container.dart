import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_bottom_navbar.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/account_page/account_page.dart';
import 'package:nft_ticketing/screens/dashboard/home_page/home_page.dart';
import 'package:nft_ticketing/screens/dashboard/messages_page/messages_page.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({
    Key? key,
    this.toView,
  }) : super(key: key);

  static const String id = '/dashboard';
  final String? toView;

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  late List<Widget> _pages;
  late int _selectedPage;

  // current active item in the navigation bar
  int activeItem = 0;

  final List<NFTBottomNavbarItem> items = [
    NFTBottomNavbarItem(
        label: 'Home', iconPath: 'assets/navbar_icons/ic-home.svg'),
    // NFTBottomNavbarItem(
    //     label: 'Community', iconPath: 'assets/navbar_icons/ic-community.svg'),
    NFTBottomNavbarItem(
        label: 'Messages', iconPath: 'assets/navbar_icons/ic-messages.svg'),
    // NFTBottomNavbarItem(
    //     label: 'Wallet', iconPath: 'assets/navbar_icons/ic-wallet.svg'),
    NFTBottomNavbarItem(
        label: 'Account', iconPath: 'assets/navbar_icons/ic-account.svg'),
  ];

  @override
  void initState() {
    super.initState();

    /*
    _selectedPage = widget.toView == null || widget.toView == HomePage.id
        ? 0
        : widget.toView == CommunityPage.id
            ? 1
            : widget.toView == MessagesPage.id
                ? 2
                : widget.toView == WalletPage.id
                    ? 3
                    : 4;

    _pages = [
      _selectedPage == 0 ? const HomePage() : const SizedBox(),
      _selectedPage == 1 ? const CommunityPage() : const SizedBox(),
      _selectedPage == 2 ? const MessagesPage() : const SizedBox(),
      _selectedPage == 3 ? const WalletPage() : const SizedBox(),
      _selectedPage == 4 ? const AccountPage() : const SizedBox(),
    ];
    */

    _selectedPage = widget.toView == null || widget.toView == HomePage.id
        ? 0
        : widget.toView == MessagesPage.id
            ? 1
            : 2;

    _pages = [
      _selectedPage == 0 ? const HomePage() : const SizedBox(),
      _selectedPage == 1 ? const MessagesPage() : const SizedBox(),
      _selectedPage == 2 ? const AccountPage() : const SizedBox(),
    ];

    activeItem = _selectedPage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkBlue,
        body: WillPopScope(
          onWillPop: () async {
            if (_selectedPage != 0) {
              setState(() {
                _selectedPage = 0;
                if (_pages[_selectedPage] is SizedBox) {
                  _pages[_selectedPage] = const HomePage();
                }
              });
            }

            return false;
          },
          child: IndexedStack(
            index: _selectedPage,
            children: _pages,
          ),
        ),
        bottomNavigationBar: NFTBottomNavBar(
          items: items,
          activeItem: activeItem,
          onTap: (index) {
            setState(() {
              if (_pages[index] is SizedBox) {
                if (index == 0) {
                  _pages[index] = const HomePage();
                } else if (index == 1) {
                  _pages[index] = const MessagesPage();
                } else if (index == 2) {
                  _pages[index] = const AccountPage();
                }
                // } else if (index == 3) {
                //   _pages[index] = const WalletPage();
                // } else if (index == 4) {
                //   _pages[index] = const AccountPage();
                // }
              }

              activeItem = index;
              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}
