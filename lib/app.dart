import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspired_learning_ai/screens/welcome/bloc/welcome_blocs.dart';
import 'package:inspired_learning_ai/screens/welcome/welcome_screen.dart';

import 'screens/login/login_screen.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  final bool welcome;
  const App({super.key, this.welcome = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ILAppTheme.lightTheme,
        darkTheme: ILAppTheme.darkTheme,
        home: welcome? const LoginScreen() : const WelcomePage(),
      ),
      )
    );
  }
}