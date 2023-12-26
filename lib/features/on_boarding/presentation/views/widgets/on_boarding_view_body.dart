import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../splash/presentation/functions/on_boarding_visited.dart';
import 'custom_nav_bar.dart';
import 'get_buttons.dart';
import 'on_boarding_widget_body.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 40.0),
          CustomNavBar(onTap: () {
            onBoardingVisited();
            customReplacementNavigate(context, kSignUpView);
          }),
          OnBoardingWidgetBody(
            pageController: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * .15),
          GetButtons(currentIndex: currentIndex, pageController: pageController),
          const SizedBox(height: 17.0),
        ],
      ),
    );
  }
}
