import 'package:deelze/core/presentation/widgets/custon_text_button.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 211, 211, 211),
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        alignment: Alignment.center,
                        width: 220,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(42),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '+201012345678',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(7, 106, 127, 1),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(42),
                              ),
                              child:
                                  Image.asset('assets/images/pencil_icon.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter verification code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(7, 106, 127, 1),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  enableActiveFill: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    fieldHeight: 80,
                    fieldWidth: 80,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(24),
                    activeFillColor: const Color.fromRGBO(239, 239, 239, 100),
                    inactiveFillColor: const Color.fromRGBO(239, 239, 239, 100),
                    selectedFillColor: const Color.fromRGBO(239, 239, 239, 100),
                    activeColor: const Color.fromRGBO(239, 239, 239, 100),
                    inactiveColor: const Color.fromRGBO(239, 239, 239, 100),
                    selectedColor: const Color.fromRGBO(239, 239, 239, 100),
                    disabledColor: const Color.fromRGBO(239, 239, 239, 100),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  keyboardType: TextInputType.number,
                  controller: textEditingController,
                  textStyle: const TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(7, 106, 127, 1),
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(7, 106, 127, 1),
                  ),
                  hintCharacter: '*',
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(height: 45),
              CustomTextButton(
                width: 220,
                height: 60,
                text: "Send",
                color: const Color.fromRGBO(7, 105, 127, 1),
                onTap: () {
                  context.go("${RoutePaths.authWrapper}/${RoutePaths.home}");
                },
              ),
              const SizedBox(height: 16),
              CustomTextButton(
                width: 220,
                height: 60,
                text: "Resend code in 00:50",
                textSize: 16,
                textColor: const Color.fromRGBO(131, 131, 131, 100),
                color: const Color.fromRGBO(239, 239, 239, 100),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
