import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';
import 'package:nft_ticketing/screens/dashboard/home_page/home_page.dart';

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
          child: Builder(
            builder: (context) {
              final data = MediaQuery.of(context).size;

              return Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 1,
                child: SizedBox(
                  height: 60,
                  width: data.width,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kDarkBlue,
                      border: Border(
                        top: BorderSide(
                          color: kSlightlyDarkBlue,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < 5; i++)
                          _NFTBarItem(
                            width: i == 3 ? 17 : null,
                            assetPath: items[i].iconPath,
                            label: items[i].label,
                            color:
                                i == activeItem ? kPrimaryColor : Colors.white,
                            onTap: () {
                              setState(() {
                                if (_pages[i] is SizedBox) {
                                  if (i == 0) {
                                    _pages[i] = const HomePage();
                                  }
                                  // else if (i == 1) {
                                  //   _pages[i] = ChatScreen();
                                  // } else if (i == 2) {
                                  //   _pages[i] = ShopScreen();
                                  // } else if (i == 3) {
                                  //   _pages[i] = SalesScreen();
                                  // } else if (i == 4) {
                                  //   _pages[i] = BagScreen();
                                  // }
                                }

                                activeItem = i;
                                _selectedPage = i;
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
          /*
        BottomNavigationBar(
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
          },
        ),
        */
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

class _NFTBarItem extends StatelessWidget {
  const _NFTBarItem({
    Key? key,
    // ignore: unused_element
    this.height = 16,
    this.width,
    this.onTap,
    required this.assetPath,
    required this.label,
    required this.color,
  }) : super(key: key);

  final double height;
  final double? width;
  final VoidCallback? onTap;
  final String assetPath;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height,
                child: SvgPicture.asset(
                  assetPath,
                  color: color,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: kRegularStyle.copyWith(
                  color: color,
                  fontSize: kRegularSize - 6,
                ),
              )
            ],
          ),
          Container(
            height: 60,
            width: size.width / 5,
            decoration: color == kPrimaryColor
                ? const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                  )
                : null,
          )
        ],
      ),
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
