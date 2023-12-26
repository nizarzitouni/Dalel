import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SlidingLogoText extends StatelessWidget {
  const SlidingLogoText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              AppStrings.appName,
              textAlign: TextAlign.center,
              style: AppTextStyles.pacifico400style64,
            ),
          );
        });
  }
}
