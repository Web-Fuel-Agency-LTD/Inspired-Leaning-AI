import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../login/login_screen.dart';
import 'welcome_items.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final controller = WelcomeItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.accent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ILImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = controller.items.length - 1 == index;
                  });
                },
                controller: pageController,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.items[index].title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.items[index].description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 200,
                child: SmoothPageIndicator(
                  onDotClicked: (index) => pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn),
                  controller: pageController,
                  count: controller.items.length,
                  effect: const SwapEffect(
                      activeDotColor: ILColors.secondary,
                      dotHeight: 11,
                      dotWidth: 11),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: isLastPage
                      ? getStarted(context)
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () => pageController
                                .jumpToPage(controller.items.length - 1),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => pageController.nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

Widget getStarted(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        final pres = await SharedPreferences.getInstance();
        pres.setBool("welcome", true);
  
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: const Text(
        'Get Started',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}
