import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NFTAppBar({
    Key? key,
    this.title = '',
  }) : super(key: key);

  final String title;

  @override
  // change height of app bar by adjusting the value
  // in the Size.fromHeight constructor
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kDarkBlue,
      toolbarHeight: preferredSize.height,
      leadingWidth: 60,
      elevation: 0,
      title: Text(
        title,
        style: kRegularStyle.copyWith(
          color: Colors.white,
          fontSize: kRegularSize,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: kDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
