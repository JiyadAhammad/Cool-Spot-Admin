import 'package:flutter/material.dart';

import '../../../constant/color/colors.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.text,
    required this.leadingIcon,
    required this.onTap,
  });
  final String text;
  final IconData leadingIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        color: kwhiteIcon,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: kwhiteText,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: kwhiteIcon,
        size: 18,
      ),
    );
  }
}
