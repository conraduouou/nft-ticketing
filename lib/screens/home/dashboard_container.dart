import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({
    Key? key,
    this.toView,
  }) : super(key: key);

  static const String id = '/nav';
  final String? toView;

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  late List<Widget> _pages;
  late int _selectedPage;

  final labels = ['home', 'chat', 'shop', 'sales', 'bag'];

  @override
  void initState() {
    super.initState();

    _selectedPage = widget.toView == null
        ? 0
        : widget.toView == ChatScreen.id
            ? 1
            : widget.toView == ShopScreen.id
                ? 2
                : widget.toView == SalesScreen.id
                    ? 3
                    : 4;

    _pages = [
      _selectedPage == 0 ? HomeScreen() : const SizedBox(),
      _selectedPage == 1 ? ChatScreen() : const SizedBox(),
      _selectedPage == 2 ? ShopScreen() : const SizedBox(),
      _selectedPage == 3 ? SalesScreen() : const SizedBox(),
      _selectedPage == 4 ? BagScreen() : const SizedBox(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            _selectedPage = 0;
            if (_pages[_selectedPage] is SizedBox) {
              _pages[_selectedPage] = HomeScreen();
            }
          });

          return false;
        },
        child: IndexedStack(
          index: _selectedPage,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        selectedLabelStyle: kXXSmallStyle,
        unselectedLabelStyle: kXXSmallStyle,
        iconSize: kLargeSize,
        backgroundColor: Colors.white,
        items: [
          for (int i = 0; i < 5; i++)
            barItem(
              label: labels[i].titleCase,
              icon: SvgPicture.asset(
                'images/navbar_icons/ic-${labels[i]}.svg',
                color: _selectedPage == i ? kPrimaryColor : kFieldHintTextColor,
              ),
            ),
        ],
        onTap: (index) {
          setState(() {
            if (_pages[index] is SizedBox) {
              if (index == 0) {
                _pages[index] = HomeScreen();
              } else if (index == 1) {
                _pages[index] = ChatScreen();
              } else if (index == 2) {
                _pages[index] = ShopScreen();
              } else if (index == 3) {
                _pages[index] = SalesScreen();
              } else if (index == 4) {
                _pages[index] = BagScreen();
              }
            }

            _selectedPage = index;
          });
        },
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
