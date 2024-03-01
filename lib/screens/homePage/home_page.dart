import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/utils/components/text_field.dart';
import 'package:inspired_learning_ai/utils/constants/colors.dart';

class HomePage extends StatelessWidget {
  final searchController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.dark,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: ILColors.primary),
            onPressed: () {
              // Add functionality when the icon is pressed
            },
          ),
        ],
        centerTitle: true,
        leading: const Icon(Icons.menu_outlined, color: ILColors.primary),
        title: SizedBox(
          height: 32, // Adjust the height as needed
          child: Image.asset(
            'assets/logo/logo2.png', // Path to your image asset
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
        ), // Remove the extra comma here
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'What do you want to learn today?',
                style: TextStyle(fontSize: 29, color: Colors.white),
              ),
              const SizedBox(height: 30),
              ILTextField(
                controller: searchController,
                hintText: 'Search for anything',
                prefix: const Icon(Icons.search_rounded),
              ), // Pass a context here if required
            ],
          ),
        ),
      ),
    );
  }
}
