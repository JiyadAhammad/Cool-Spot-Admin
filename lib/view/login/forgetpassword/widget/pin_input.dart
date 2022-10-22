import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../constant/color/colors.dart';

class PinputExample extends StatefulWidget {
  const PinputExample({super.key});

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color focusedBorderColor = Color.fromARGB(255, 0, 0, 0);
    const Color fillColor = Color.fromARGB(0, 0, 0, 0);
    const Color borderColor = Color.fromARGB(102, 0, 0, 0);

    final PinTheme defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
      ),
    );
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (String? value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (String pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (String value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(width: 3),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              formKey.currentState!.validate();
              settingModalBottomSheet(context);
            },
            child: const Text(
              'Validate',
              style: TextStyle(
                color: kblackText,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void settingModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SizedBox(
        height: MediaQuery.of(context).size.width / 1.5,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.music_note),
              title: const Text('Music'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Video'),
              onTap: () {},
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: const Icon(Icons.check),
              label: const Text('Save'),
            ),
          ],
        ),
      );
    },
  );
}
