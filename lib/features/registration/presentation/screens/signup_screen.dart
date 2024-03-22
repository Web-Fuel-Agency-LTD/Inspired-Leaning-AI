import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../authentication/presentation/screens/login_screen.dart';
import 'signup_with_email.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ILColors.accent,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(ILImages.background),
              fit: BoxFit.cover,
            )),
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo/logo.png', width: 146),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Let\'s get Started!',
                        style: TextStyle(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 50,
                    ),
                    SignupButton(
                      imageSignup: 'assets/logo/email.png',
                      signupWith: 'Sign up with Email',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupWithEmail()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SignupButton(
                      imageSignup: 'assets/logo/apple.png',
                      signupWith: 'Sign up with Apple',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SignupButton(
                      imageSignup: 'assets/logo/google.png',
                      signupWith: 'Sign up with Google',
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.white,
                                height: 36,
                              )),
                        ),
                        const Text("or",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: const Divider(
                                color: Colors.white,
                                height: 36,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Sign up with',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignupButtonCircle(
                          imageSignup: 'assets/logo/facebook.png',
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SignupButtonCircle(
                          imageSignup: 'assets/logo/twitter.png',
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SignupButtonCircle(
                          imageSignup: 'assets/logo/tiktok.png',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text('Log In',
                                style: TextStyle(
                                    color: ILColors.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}

class SignupButton extends StatelessWidget {
  final String imageSignup;
  final String signupWith;
  final VoidCallback onTap;

  const SignupButton({
    required this.imageSignup,
    required this.signupWith,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 54,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageSignup,
                width: 22,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(signupWith,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18))
            ],
          )),
    );
  }
}

class SignupButtonCircle extends StatelessWidget {
  final String imageSignup;

  const SignupButtonCircle({
    required this.imageSignup,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageSignup,
              ),
            ],
          )),
    );
  }
}
