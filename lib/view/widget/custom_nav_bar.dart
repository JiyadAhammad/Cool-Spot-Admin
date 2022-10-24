import 'package:flutter/material.dart';

import '../constant/color/colors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kblack,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(
                Icons.home,
                color: kwhite,
                size: 35,
              ),
              label: const Text(
                'Home',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/order');
              },
              icon: const Icon(
                Icons.menu_book,
                color: kwhite,
                size: 35,
              ),
              label: const Text(
                'Orders',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/status');
              },
              icon: const Icon(
                Icons.pie_chart,
                color: kwhite,
                size: 35,
              ),
              label: const Text(
                'Status',
                style: TextStyle(
                  color: kwhiteText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
