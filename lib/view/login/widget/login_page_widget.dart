import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import 'login_text_feild.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.fText = '',
    required this.ftextOnpressed,
  });
  final String buttonText;
  final Function() ftextOnpressed;
  final String fText;
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
            TextButton(
              onPressed: widget.ftextOnpressed,
              child: Text(
                widget.fText,
                style: const TextStyle(
                  color: kgreen,
                ),
              ),
            ),
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
              // onPressed: () {
              //   // Navigator.pushReplacementNamed(context, '/home');
              // },
              child: Text(
                widget.buttonText,
                style: const TextStyle(
                  color: kwhiteText,
                  fontSize: 20,
                ),
              ),
            ),
            kheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/images/facebook.png'),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/images/google.png'),
                ),
              ],
            ),
            kheight,
          ],
        ),
      ],
    );
  }

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userEmail.text.trim(),
      password: userPassword.text.trim(),
    );
  }
}
