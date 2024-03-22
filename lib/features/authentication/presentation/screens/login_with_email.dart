import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspired_learning_ai/features/authentication/presentation/screens/forgot_password.dart';
import 'package:inspired_learning_ai/features/main/presentation/screens/home_page.dart';
import 'package:inspired_learning_ai/features/authentication/presentation/bloc/login_with_email_cubit.dart';
import 'package:inspired_learning_ai/core/utils/components/elevated_button.dart';
import 'package:inspired_learning_ai/core/utils/components/text_field.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import 'login_screen.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginWithEmailCubit(),
      child: Scaffold(
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
                    BlocConsumer<LoginWithEmailCubit, LoginWithEmailCubitState>(
                      listener: (context, state) {
                        if (state is LoginWithEmailCubitSuccess) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      builder: (context, state) {
                        return ILElevatedButton(
                          width: double.infinity,
                          onPressed: () {
                            BlocProvider.of<LoginWithEmailCubit>(context)
                                .validateEmailAndPassword(emailController.text,
                                    passwordController.text);
                          },
                          text: 'Login',
                        );
                      },
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
