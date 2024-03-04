import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import '../../../utils/components/elevated_button.dart';
import '../../../utils/components/text_field.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../signup_screen.dart';

class SignupWithEmail extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SignupWithEmail({super.key});

  @override
  State<SignupWithEmail> createState() => _SignupWithEmailState();
}

class _SignupWithEmailState extends State<SignupWithEmail> {
  final firstNameTextController = TextEditingController();

  final lastNameTextController = TextEditingController();

  final emailTextController = TextEditingController();

  final verificationTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final confirmPasswordTextController = TextEditingController();

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ILColors.accent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ILImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ILImages.logo, width: 146),
                        const SizedBox(height: 20),
                        const Text('Sign Up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 38)),
                        const SizedBox(height: 30),
                        const Text('PERSONAL INFORMATION',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        ILTextField(
                          controller: firstNameTextController,
                          hintText: 'First Name',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        ILTextField(
                          controller: lastNameTextController,
                          hintText: 'Last Name',
                          obscureText: false,
                        ),
                        const SizedBox(height: 30),
                        const Text('VERIFY YOUR EMAIL ADDRESS',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        ILTextField(
                          controller: emailTextController,
                          hintText: 'Email Address',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        ILElevatedButton(
                          width: 115,
                          onPressed: () {},
                          text: 'Send Now',
                        ),
                        const SizedBox(height: 20),
                        const Text(ILText.enterDigit,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 20),
                        Stack(
                          children: [
                            ILTextField(
                              controller: verificationTextController,
                              hintText: 'Verification Code',
                              obscureText: false,
                            ),
                            Positioned(
                              right: 0,
                              child: ILElevatedButton(
                                width: 115,
                                onPressed: () {},
                                text: 'Verify',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Didn\'t get the code?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'RESEND',
                                  style: TextStyle(
                                      color: ILColors.secondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text('SET UP PASSWORD',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        ILTextField(
                          controller: passwordTextController,
                          hintText: 'Password',
                          obscureText: true,
                          icon: Icons.visibility_off_outlined,
                        ),
                        const SizedBox(height: 20),
                        FlutterPwValidator(
                            width: 450,
                            height: 150,
                            minLength: 8,
                            onSuccess: () {},
                            uppercaseCharCount: 1,
                            numericCharCount: 2,
                            specialCharCount: 1,
                            controller: passwordTextController),
                        const SizedBox(height: 30),
                        ILTextField(
                          controller: confirmPasswordTextController,
                          hintText: 'Confirm Password',
                          obscureText: true,
                          icon: Icons.visibility_off_outlined,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                activeColor: ILColors.secondary,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? true;
                                  });
                                }),
                            SizedBox(
                              width: 290,
                              child: RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          16), // This will apply the default text style
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: const TextStyle(
                                          color: ILColors.secondary,
                                          fontSize:
                                              16), // Change color of specific text
                                      // ignore: avoid_print
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => print('Tap Here onTap'),
                                    ),
                                    const TextSpan(
                                        text: ' and',
                                        style: TextStyle(fontSize: 16)),
                                    TextSpan(
                                      text: ' Terms of Use',
                                      style: const TextStyle(
                                          color: ILColors.secondary,
                                          fontSize: 16),
                                      // ignore: avoid_print
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => print('Tap Here onTap'),
                                    ),
                                    const TextSpan(
                                        text:
                                            ' of Inspired Learning before signing up.',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        ILElevatedButton(
                            width: double.infinity,
                            onPressed: () {
                              if (firstNameTextController.text.isEmpty ||
                                  lastNameTextController.text.isEmpty ||
                                  emailTextController.text.isEmpty ||
                                  verificationTextController.text.isEmpty ||
                                  passwordTextController.text.isEmpty ||
                                  confirmPasswordTextController.text.isEmpty ||
                                  isChecked == false
                                  ) {
                                
                                
                                print('failed');
                                null;
                              } else {
                                print('sign up');
                              }
                            },
                            text: 'Sign up')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
