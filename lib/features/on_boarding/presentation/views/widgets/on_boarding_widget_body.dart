import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import 'custom_smooth_page_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody({super.key});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesOnBoarding1),
              const SizedBox(height: 24.0),
              CustomSmoothPageIndicator(pageController: pageController),
              const SizedBox(height: 32.0),
              Text(
                'Explore The history with Dalel in a smart way',
                style: AppTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Explore The history with Dalel in a smart way',
                style: AppTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }
}
