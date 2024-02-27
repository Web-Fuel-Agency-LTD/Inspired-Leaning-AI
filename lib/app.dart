import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspired_learning_ai/pages/welcome/bloc/welcome_blocs.dart';
import 'package:inspired_learning_ai/pages/welcome/welcome_page.dart';

import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

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
        home: WelcomePage(),
      ),
      )
    );
  }
}