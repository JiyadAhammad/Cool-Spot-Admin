import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.userInput,
  });
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController userInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        controller: userInput,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
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
