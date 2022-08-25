import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/home/home_page/home_page.dart';

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

  final List<NavbarItem> items = [
    NavbarItem(label: 'Home', iconPath: 'assets/navbar_icons/ic-home.svg'),
    NavbarItem(
        label: 'Community', iconPath: 'assets/navbar_icons/ic-community.svg'),
    NavbarItem(
        label: 'Messages', iconPath: 'assets/navbar_icons/ic-messages.svg'),
    NavbarItem(label: 'Wallet', iconPath: 'assets/navbar_icons/ic-wallet.svg'),
    NavbarItem(
        label: 'Account', iconPath: 'assets/navbar_icons/ic-account.svg'),
  ];

  @override
  void initState() {
    super.initState();

    _selectedPage = 0;
    // widget.toView == null
    //     ? 0
    //     : widget.toView == ChatScreen.id
    //         ? 1
    //         : widget.toView == ShopScreen.id
    //             ? 2
    //             : widget.toView == SalesScreen.id
    //                 ? 3
    //                 : 4;

    _pages = [
      _selectedPage == 0 ? const HomePage() : const SizedBox(),
      // _selectedPage == 1 ? ChatScreen() : const SizedBox(),
      // _selectedPage == 2 ? ShopScreen() : const SizedBox(),
      // _selectedPage == 3 ? SalesScreen() : const SizedBox(),
      // _selectedPage == 4 ? BagScreen() : const SizedBox(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 1,
          backgroundColor: kDarkBlue,
          currentIndex: _selectedPage,
          iconSize: kRegularSize,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: kRegularStyle.copyWith(
            fontSize: kRegularSize - 6,
          ),
          unselectedLabelStyle: kRegularStyle.copyWith(
            fontSize: kRegularSize - 6,
            color: Colors.white,
          ),
          items: [
            for (int i = 0; i < 5; i++)
              barItem(
                label: items[i].label,
                icon: SizedBox(
                  height: 16,
                  width: i == 3 ? 17 : null,
                  child: SvgPicture.asset(
                    items[i].iconPath,
                    color: _selectedPage == i ? kPrimaryColor : Colors.white,
                  ),
                ),
              ),
          ],
          onTap: (index) {
            setState(() {
              if (_pages[index] is SizedBox) {
                if (index == 0) {
                  _pages[index] = const HomePage();
                }
                // else if (index == 1) {
                //   _pages[index] = ChatScreen();
                // } else if (index == 2) {
                //   _pages[index] = ShopScreen();
                // } else if (index == 3) {
                //   _pages[index] = SalesScreen();
                // } else if (index == 4) {
                //   _pages[index] = BagScreen();
                // }
              }

              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem barItem(
      {required Widget icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: icon,
      ),
      label: label,
      tooltip: '',
    );
  }
}

class NavbarItem {
  NavbarItem({
    required this.label,
    required this.iconPath,
  });

  final String label;
  final String iconPath;
}
