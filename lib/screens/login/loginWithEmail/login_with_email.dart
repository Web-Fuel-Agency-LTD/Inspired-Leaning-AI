import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/screens/forgotPassword/forgot_password.dart';
import 'package:inspired_learning_ai/utils/components/elevated_button.dart';
import 'package:inspired_learning_ai/utils/components/text_field.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../login_screen.dart';

class LoginWithEmail extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.accent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ILImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                  color: Colors.white,
                ),
                Column(children: [
                  Image.asset(
                    ILImages.logo,
                    width: 146,
                  ),
                  const SizedBox(height: 20),
                  const Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 38)),
                  const SizedBox(height: 50),
                  ILTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    ),
                  const SizedBox(height: 20),
                  ILTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icon: Icons.visibility_off_outlined,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                            
                          },
                          child: const Text('Forgot Password?',
                              style: TextStyle(
                                  color: ILColors.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                  const SizedBox(height: 50),
                  ILElevatedButton(
                      width: double.infinity, onPressed: () {

                      }, text: 'Login')
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
