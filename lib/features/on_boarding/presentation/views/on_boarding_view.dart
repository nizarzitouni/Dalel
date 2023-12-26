import 'package:dalel/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        body: OnBoardingViewBody(),
      ),
    );
  }
}
