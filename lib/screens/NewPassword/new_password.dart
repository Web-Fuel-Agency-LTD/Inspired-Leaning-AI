import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:inspired_learning_ai/screens/forgotPassword/forgot_password.dart';
import 'package:inspired_learning_ai/screens/homePage/home_page.dart';

import '../../utils/components/elevated_button.dart';
import '../../utils/components/text_field.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class NewPassword extends StatelessWidget {

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.accent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ILImages.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPassword())); // Navigate back
                          },
                          icon: const Icon(Icons.arrow_back_outlined),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ILTextField(
                      controller: newPasswordController,
                      hintText: 'New Password',
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
                            controller: newPasswordController),
                    const SizedBox(height: 20),
                    ILTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      icon: Icons.visibility_off_outlined,
                      ),
                    const SizedBox(height: 50),
                    ILElevatedButton(
                        width: double.infinity,
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                        },
                        text: 'Login')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}