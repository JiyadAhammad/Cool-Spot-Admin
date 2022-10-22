import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import 'widget/pin_input.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  static const String routeName = '/forget';
  static Route<ForgetPassword> route() {
    return MaterialPageRoute<ForgetPassword>(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ForgetPassword(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const Text(
                  'Verfication',
                  style: TextStyle(
                    fontSize: 30,
                    color: kblackText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight20,
                const Text(
                  'Enter the code sent to the number',
                  style: TextStyle(
                    fontSize: 18,
                    color: kblackText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                kheight20,
                const Text(
                  '+91 8304946832',
                  style: TextStyle(
                    fontSize: 22,
                    color: kblackText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                kheight20,
                SizedBox(
                  child: Image.asset('assets/images/otp.png'),
                ),
                kheight20,
                const FractionallySizedBox(
                  widthFactor: 1,
                  child: PinputExample(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
