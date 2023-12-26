import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../data/models/on_boarding_model.dart';
import 'custom_smooth_page_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key, required this.pageController, required this.onPageChanged});
  final PageController pageController;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: onPageChanged,
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: onBoardingData.length,
            itemBuilder: (context, index) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 290,
                    width: 343,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(onBoardingData[index].imagePath), fit: BoxFit.fill)),
                  ),
                  const SizedBox(height: 62.0),
                  Text(
                    onBoardingData[index].title,
                    style: AppTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    onBoardingData[index].subTitle,
                    style: AppTextStyles.poppins300style16,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
          Positioned(
              bottom: SizeConfig.screenHeight * 1 / 5,
              left: SizeConfig.screenWidth * 1 / 2.5,
              child: CustomSmoothPageIndicator(pageController: pageController)),
        ],
      ),
    );
  }
}
