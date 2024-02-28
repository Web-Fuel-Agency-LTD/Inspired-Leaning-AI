import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class SignupWithEmail extends StatelessWidget {
  const SignupWithEmail({Key? key}) : super(key: key); // Corrected constructor

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
        child: Center( // Centering the column vertically
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ILImages.logo, width: 146),
              const SizedBox(height: 20),
              const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 38)),
              const SizedBox(height: 20),
              const Text('PERSONAL INFORMATION', style: TextStyle(color: Colors.white, fontSize: 18)),
              
            ],
          ),
        ),
      ),
    );
  }
}
