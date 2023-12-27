import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: Text(text, style: AppTextStyles.poppins600style28));
  }
}
