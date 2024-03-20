import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import 'textbook_screen.dart';

class LearningTypes extends StatelessWidget {
  const LearningTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.dark,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: ILColors.primary,
        child: const Icon(Icons.menu, color: Colors.white, size: 35),
        onPressed: () {},
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(children: [
              TextbookScreen(),
              

            ],),
          ),
        ),
      ),
    );
  }
}
