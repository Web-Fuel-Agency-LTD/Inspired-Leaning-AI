import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/features/main/domain/entities/category_model.dart';
import 'package:inspired_learning_ai/features/main/presentation/widgets/comming_soon.dart';
import 'package:inspired_learning_ai/features/user/presentation/screens/account_screen.dart';
import 'package:inspired_learning_ai/core/utils/components/text_field.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/core/utils/constants/image_strings.dart';

import '../../../user/presentation/screens/personal_information.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: connect to the backend
    // TODO: replace the sample data with the actual data from the backend
    final categories = [
      CategoryModel(name: '11+', image: ILImages.category),
      CategoryModel(name: 'GCSE', image: ILImages.category1),
      CategoryModel(name: 'A-Level', image: ILImages.category2),
      CategoryModel(name: 'University', image: ILImages.category),
      CategoryModel(name: 'Careers', image: ILImages.category1),
      CategoryModel(name: 'General', image: ILImages.category2),
    ];

    return Scaffold(
      backgroundColor: ILColors.dark,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: ILColors.primary),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalInformationScreens()));
            },
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
          child: NavigationBar(
            destinations: [
              Container(
                color: ILColors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: ILColors.secondary,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(color: ILColors.secondary),
                    )
                  ],
                ),
              ),
              Container(
                color: ILColors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, color: Colors.grey),
                    Text('Progress', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()));
                },
                child: Container(
                  color: ILColors.primary,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_2_outlined),
                      Text('Account', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                        color:
                            ILColors.primary), // Change color of specific word
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
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: List.generate(
                    categories.length,
                    (index) => GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          CommingSoonDialog.show(
                              context, categories[index].name);
                        }
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(categories[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 104,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    ILColors.primary.withOpacity(.88),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.2, 1.0],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                categories[index].name,
                                style: const TextStyle(
                                  color: ILColors.textWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
