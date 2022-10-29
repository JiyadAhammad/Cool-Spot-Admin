import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.userInput,
    this.visible = false,
  });
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController userInput;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        controller: userInput,
        obscureText: visible,
        style: const TextStyle(
          fontSize: 20,
          color: kblackText,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          prefixIcon: Icon(
            // Icons.person_outline_rounded,
            prefixIcon,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          // hintText: 'Email/Mobile',
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
