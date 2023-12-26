import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import 'custom_nav_bar.dart';
import 'on_boarding_widget_body.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40.0),
          const CustomNavBar(),
          OnBoardingWidgetBody(),
          const CustomBtn(
            text: 'Next',
            //color: AppColors.primaryColor,
          ),
          const SizedBox(height: 17.0),
        ],
      ),
    );
  }
}
