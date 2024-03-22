import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/injectable_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/main/presentation/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final prefs = await SharedPreferences.getInstance();
  final welcome = prefs.getBool("welcome") ?? false;

  runApp(App(welcome: welcome));
}
