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
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        leading: const Icon(Icons.sort, color: ILColors.primary),
        title: SizedBox(
          height: 32,
          child: Image.asset(
            'assets/logo/logo2.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: ILColors.primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 13,
            unselectedFontSize: 13,
            unselectedItemColor: Colors.grey,
            selectedItemColor: ILColors.secondary,
            backgroundColor: ILColors.accent,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.blur_circular,
                ),
                label: 'Progress',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                ),
                label: 'Account', // Add label for the item
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 29, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'What do you want to ',
                    ),
                    TextSpan(
                      text: 'learn',
                      style: TextStyle(
                          color: ILColors
                              .primary), // Change color of specific word
                    ),
                    TextSpan(
                      text: ' today?',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ILTextField(
                obscureText: false,
                controller: searchController,
                hintText: 'Search for anything',
                prefix: const Icon(Icons.search_rounded),
              ),
              // Container(
              //     child: GridView(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //   ),
              //   children: [
              //     Container(color: ILColors.accent),
              //     Container(color: ILColors.accent),
              //     Container(color: ILColors.accent),
              //   ],
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
