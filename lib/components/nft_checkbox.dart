import 'package:flutter/material.dart';
import 'package:nft_ticketing/constants.dart';

class NFTCheckbox extends StatelessWidget {
  const NFTCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: value ? kPrimaryColor : kSlightlyDarkBlue,
        ),
        child: value
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : Container(),
      ),
    );
  }
}
