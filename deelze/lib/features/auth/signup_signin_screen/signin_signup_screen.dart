import 'package:deelze/core/presentation/widgets/custon_text_button.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SigninSignupScreen extends StatefulWidget {
  const SigninSignupScreen({super.key});

  @override
  State<SigninSignupScreen> createState() => _SigninSignupScreenState();
}

class _SigninSignupScreenState extends State<SigninSignupScreen> {
  final numberController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Spacer(),
                  Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                  const Spacer(),
                ],
              ),
              // Image.asset(
              //   "assets/images/signin_signup_avatar_picker.png",
              // ),
              SvgPicture.asset("assets/images/signin_signup_avatar_picker.svg"),
              const SizedBox(height: 20),
              Text(
                'Sign in / Sign up',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(131, 131, 131, 1),
                    ),
              ),
              const SizedBox(height: 50),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 50),
                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(239, 239, 239, 100),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(64),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 80,
                          left: 32.0,
                          right: 32.0,
                        ),
                        child: Column(
                          children: [
                            InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                print(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.DROPDOWN,
                                trailingSpace: false,
                              ),
                              ignoreBlank: false,
                              hintText: 'Enter phone number',
                              autoValidateMode: AutovalidateMode.disabled,
                              // selectorTextStyle: const TextStyle(
                              //   color: Color.fromRGBO(7, 105, 127, 1),
                              // ),
                              selectorTextStyle: const TextStyle(
                                color: Color.fromRGBO(169, 202, 209, 1),
                              ),

                              initialValue: null,
                              textFieldController: numberController,
                              formatInput: false,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              inputBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              textAlign: TextAlign.left,
                              // cursorColor:
                              //     const Color.fromRGBO(7, 106, 127, 100),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w200,
                                color: Color.fromRGBO(7, 105, 127, 1),
                              ),
                              onSaved: (PhoneNumber number) {
                                print('On Saved: $number');
                              },
                            ),
                            const SizedBox(height: 80),
                            CustomTextButton(
                              width: 220,
                              height: 60,
                              text: "Send",
                              color: const Color.fromRGBO(7, 105, 127, 1),
                              onTap: () {
                                context.push(
                                    "${RoutePaths.authWrapper}/${RoutePaths.enterCode}");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
