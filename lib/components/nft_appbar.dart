import 'package:flutter/material.dart';
import 'package:nft_ticketing/components/nft_back_button.dart';
import 'package:nft_ticketing/constants.dart';

class NFTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NFTAppBar({
    Key? key,
    this.title = '',
    this.showLeading = true,
    this.showDivider = false,
    this.fontSize,
    this.height,
  }) : super(key: key);

  final String title;
  final bool showLeading;
  final bool showDivider;
  final double? fontSize;

  final double? height;

  @override
  // change height of app bar by adjusting the value
  // in the Size.fromHeight constructor
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight + 15);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kDarkBlue,
      toolbarHeight: preferredSize.height,
      leadingWidth: 60,
      automaticallyImplyLeading: showLeading,
      elevation: 0,
      shape: showDivider
          ? const Border(
              bottom: BorderSide(
              color: kSlightlyDarkBlue,
              width: 1,
            ))
          : null,
      title: Text(
        title,
        style: kRegularStyle.copyWith(
          color: Colors.white,
          fontSize: fontSize ?? kRegularSize,
        ),
      ),
      leading: showLeading
          ? const Padding(
              padding: EdgeInsets.only(left: 20),
              child: NFTBackButton(),
            )
          : null,
    );
  }
}
