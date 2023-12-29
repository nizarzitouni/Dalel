import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ForgotPasswordSubtitile extends StatelessWidget {
  const ForgotPasswordSubtitile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        'Enter your registered email below to receive password reset instruction',
        style: AppTextStyles.poppins400style12.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
