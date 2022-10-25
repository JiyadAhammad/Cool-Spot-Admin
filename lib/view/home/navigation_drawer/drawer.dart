import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/color/colors.dart';
import 'widget/drawer_list_tile.dart';

class Navdrawer extends StatelessWidget {
  const Navdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kblack,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: CircleAvatar(
              backgroundColor: ktransparent,
              child: Text(
                'CoolSpot',
                style: TextStyle(
                  color: kwhiteText,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          DrawerListTile(
            text: 'History',
            leadingIcon: Icons.text_format_sharp,
            onTap: () {},
          ),
          DrawerListTile(
            text: 'Settings',
            leadingIcon: Icons.settings,
            onTap: () {},
          ),
          DrawerListTile(
            text: 'About',
            leadingIcon: Icons.info,
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: const CircleAvatar(
                  radius: 25,
                  backgroundColor: kwhite,
                  backgroundImage: AssetImage(
                    'assets/img/lunchericon.png',
                  ),
                ),
                applicationName: 'ΜΟΥΣΙΚΗ',
                applicationVersion: '1.0.0+1',
                children: <Widget>[
                  const Text(
                    'CoolSpot is an  Where you can buy goods, created by JIYAD AHAMMAD',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            },
          ),
          DrawerListTile(
            text: 'Exit',
            leadingIcon: Icons.exit_to_app,
            onTap: () => exitApp(context),
          ),
          const SizedBox(
            height: 140,
          ),
          const ListTile(
            title: Text(
              ' version',
              style: TextStyle(color: kwhiteText),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              '1.0.0+1',
              style: TextStyle(
                color: Color.fromARGB(255, 159, 209, 203),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void exitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Do you want to exit'),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
