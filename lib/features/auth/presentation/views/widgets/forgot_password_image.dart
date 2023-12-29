import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235,
      height: 235,
      child: Image.asset(AppAssets.imagesFogetPassword),
    );
  }
}
