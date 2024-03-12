import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/components/elevated_button.dart';

import '../../../../core/utils/components/text_field.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../main/presentation/screens/home_page.dart';

class PersonalInformationScreens extends StatelessWidget {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();

  PersonalInformationScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ILColors.dark,
        appBar: AppBar(
            title: const Text(
              'Personal Information',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.white,
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 117,
                  height: 117,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: ILColors.accent),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Change photo',
                        style: TextStyle(
                            color: ILColors.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 20,
                ),
                const Text('PERSONAL INFORMATION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18)),
                const SizedBox(
                  height: 15,
                ),
                ILTextField(
                  controller: firstNameController,
                  hintText: 'John',
                ),
                const SizedBox(
                  height: 15,
                ),
                ILTextField(
                  controller: firstNameController,
                  hintText: 'Doe',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('EMAIL ADDRESS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18)),
                const SizedBox(
                  height: 15,
                ),
                ILTextField(
                  controller: firstNameController,
                  hintText: 'johndoe@gmail.com',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('USERNAME',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 15,
                ),
                ILTextField(
                  controller: firstNameController,
                  hintText: 'jonDoe1',
                ),
                const SizedBox(
                  height: 50,
                ),
                ILElevatedButton(
                    width: double.infinity, onPressed: () {}, text: 'Save'),
                const SizedBox(
                  height: 50,
                ),
                const Text('Request Account Deletion',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white))
              ],
            ),
          ),
        ));
  }
}
