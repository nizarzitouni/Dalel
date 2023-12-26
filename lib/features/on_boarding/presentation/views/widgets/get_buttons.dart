import 'package:flutter/material.dart';

import '../../../../../core/function/navigation.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';

import '../../../../../core/widgets/custom_btn.dart';
import '../../../../splash/presentation/functions/on_boarding_visited.dart';
import '../../../data/models/on_boarding_model.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({super.key, required this.currentIndex, required this.pageController});
  final int currentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
              text: AppStrings.createAccount,
              onPressed: () {
                onBoardingVisited();
                customReplacementNavigate(context, kSignUpView);
              }),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              onBoardingVisited();
              customReplacementNavigate(context, kLogInView);
            },
            child: Text(
              AppStrings.loginNow,
              style: AppTextStyles.poppins300style16.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
        },
      );
    }
  }
}
