import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';

class WelcomePage extends StatelessWidget {
   WelcomePage({super.key});
  
  final _controller = PageController();

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
          padding: const EdgeInsets.symmetric(
            horizontal: 35.0,
          ),
          child: Stack(children: [
            PageView(
              controller: _controller,
              children: [
                Column(children: [
                  Container(
                    height: 365.h,
                  ),
                  const Text(
                    ILText.onBoardingTitle1,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    ILText.onBoardingSubTitle1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
                Column(children: [
                  Container(
                    height: 365.h,
                  ),
                  const Text(ILText.onBoardingTitle2,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 10,),
                  const Text(
                    ILText.onBoardingSubTitle2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
                Column(children: [
                  Container(
                    height: 365.h,
                  ),
                  const Text(ILText.onBoardingTitle3,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 10,),
                  const Text(
                    ILText.onBoardingSubTitle3,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
                Column(children: [
                  Container(
                    height: 365.h,
                  ),
                  const Text(ILText.onBoardingTitle4,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 10,),
                  const Text(
                    ILText.onBoardingSubTitle4,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ],
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: SmoothPageIndicator(controller: _controller, count: 4,),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 55.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Cabin'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 18,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
