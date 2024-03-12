import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/features/authentication/presentation/screens/check_email.dart';
import 'package:inspired_learning_ai/features/authentication/presentation/screens/login_with_email.dart';
import 'package:inspired_learning_ai/core/utils/components/elevated_button.dart';
import 'package:inspired_learning_ai/core/utils/components/text_field.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  final emailController = TextEditingController();

  // ignore: use_key_in_widget_constructors
  ForgotPassword({Key? key});

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
                                        LoginWithEmail())); // Navigate back
                          },
                          icon: const Icon(Icons.arrow_back_outlined),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      ILText.forgotPassword,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 50),
                    ILTextField(controller: emailController, hintText: 'Email'),
                    const SizedBox(height: 20),
                    ILElevatedButton(
                        width: double.infinity,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckEmail()));
                        },
                        text: 'Send Code')
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
