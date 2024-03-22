import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_with_email_state.dart';
import 'signup_with_events.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>{
  
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupBloc(super.initialState);

  // Methods for handling signup logic
  void sendVerificationCode() {
    // Implement logic to send verification code
    // You can access controller values like: firstNameController.text, etc.
    // For demonstration purposes, just print the message
  }

  void verifyCode() {
    // Implement logic to verify verification code
    // You can access controller values like: verificationController.text
    // For demonstration purposes, just print the message
    
  }

  void resendCode() {
    // Implement logic to resend verification code
    // For demonstration purposes, just print the message
   
  }

  // Clean up resources when the bloc is disposed
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    verificationController.dispose();
    passwordController.dispose();
  }
}
