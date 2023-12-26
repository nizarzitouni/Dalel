import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/function/navigation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_router.dart';
import 'sliding_logo_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    delayedNavigateToOnBoarding(context);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlidingLogoText(
        slidingAnimation: slidingAnimation,
      ),
    );
  }

  void delayedNavigateToOnBoarding(BuildContext ctx) {
    bool isOnBoardingVisited = CacheHelper().getData(key: 'isOnBoardingVisited') ?? false;

    if (!isOnBoardingVisited) {
      Future.delayed(const Duration(seconds: 3), () {
        customReplacementNavigate(ctx, kOnBoardingView);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        customReplacementNavigate(ctx, kSignUpView);
      });
    }
  }

  void initSlidingAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    //we are using the slidingAnimation object beacause we need time more then 0 to 1(wich AnimationController provides)
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(animationController);
    animationController.forward();
  }
}
