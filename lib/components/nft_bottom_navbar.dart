import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_ticketing/constants.dart';

class NFTBottomNavBar extends StatelessWidget {
  const NFTBottomNavBar({
    Key? key,
    required this.items,
    required this.activeItem,
    this.height,
    this.onTap,
  }) : super(key: key);

  final List<NFTBottomNavbarItem> items;
  final int activeItem;

  final double? height;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
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
              for (int i = 0; i < items.length; i++)
                _NFTBarItem(
                  width: i == 3 ? 17 : null,
                  assetPath: items[i].iconPath,
                  label: items[i].label,
                  color: i == activeItem ? kPrimaryColor : Colors.white,
                  onTap: () {
                    if (onTap != null) onTap!(i);
                  },
                ),
            ],
          ),
        ),
      ),
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

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
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
            width: size.width / 3, // change divisor by number of items
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

class NFTBottomNavbarItem {
  NFTBottomNavbarItem({
    required this.label,
    required this.iconPath,
  });

  final String label;
  final String iconPath;
}
