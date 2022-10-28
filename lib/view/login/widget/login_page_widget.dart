import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import 'login_text_feild.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.ftextOnpressed,
  });
  final String buttonText;
  final Function() ftextOnpressed;
  final Function() onPressed;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final TextEditingController userEmail = TextEditingController();

  final TextEditingController userPassword = TextEditingController();

  @override
  void dispose() {
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width / 3,
        horizontal: 10,
      ),
      shrinkWrap: true,
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset('assets/images/login.png'),
          ],
        ),
        kheight50,
        Column(
          children: <Widget>[
            LoginTextFormField(
              userInput: userEmail,
              prefixIcon: Icons.person,
              hintText: 'Email/Mobile',
            ),
            LoginTextFormField(
              userInput: userPassword,
              prefixIcon: Icons.https,
              hintText: 'Password',
            ),
            kheight20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kblack,
                minimumSize: Size(
                  MediaQuery.of(context).size.width / 1.5,
                  50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: signIn,
              child: Text(
                widget.buttonText,
                style: const TextStyle(
                  color: kwhiteText,
                  fontSize: 20,
                ),
              ),
            ),
            kheight20,
          ],
        ),
      ],
    );
  }

  Future<void> signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(
              child: CupertinoActivityIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail.text.trim(),
        password: userPassword.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      log(
        e.toString(),
      );
    }
    navigatorKey.currentState!.popUntil(
      (Route<dynamic> route) => route.isFirst,
    );
  }
}
