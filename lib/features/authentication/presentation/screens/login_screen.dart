import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../registration/presentation/screens/signup_screen.dart';
import 'login_with_email.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/logo.png',
                      width: 146,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Welcome Back!',
                        style: TextStyle(fontSize: 38, color: Colors.white)),
                    const SizedBox(
                      height: 60,
                    ),
                    LoginButton(
                      imageLogin: 'assets/logo/email.png',
                      loginWith: 'Login with Email',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginWithEmail()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LoginButton(
                      imageLogin: 'assets/logo/apple.png',
                      loginWith: 'Login with Apple',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LoginButton(
                      imageLogin: 'assets/logo/google.png',
                      loginWith: 'Login with Google',
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
                    const Text('Login with',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginButtonCircle(
                          imageLogin: 'assets/logo/facebook.png',
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginWithEmail()));
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        LoginButtonCircle(
                          imageLogin: 'assets/logo/twitter.png',
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        LoginButtonCircle(
                          imageLogin: 'assets/logo/tiktok.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: ILColors.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}

class LoginButton extends StatelessWidget {
  final String imageLogin;
  final String loginWith;
  final VoidCallback? onTap;

  const LoginButton({
    required this.imageLogin,
    required this.loginWith,
    this.onTap,
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
                imageLogin,
                width: 22,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(loginWith,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18))
            ],
          )),
    );
  }
}

class LoginButtonCircle extends StatelessWidget {
  final String imageLogin;
  final VoidCallback onTap;

  const LoginButtonCircle({
    required this.imageLogin,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageLogin,
              ),
            ],
          )),
    );
  }
}
