import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.barTitle,
    required this.action,
    required this.onPressed,
  });
  final String barTitle;
  final IconData action;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kblack,
      elevation: 0,
      title: Text(barTitle),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            action,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
