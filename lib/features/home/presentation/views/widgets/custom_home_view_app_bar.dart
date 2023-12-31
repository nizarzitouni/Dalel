import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/utils.dart';

class CustomHomeViewAppBAr extends StatelessWidget {
  const CustomHomeViewAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.imagesMenu),
        Text(
          AppStrings.appName,
          style: AppTextStyles.pacifico400style64.copyWith(fontSize: 22),
        )
      ],
    );
  }
}
