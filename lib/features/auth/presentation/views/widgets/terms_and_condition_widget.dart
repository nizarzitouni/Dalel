import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class TermsAndCondtionWidget extends StatelessWidget {
  const TermsAndCondtionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: AppStrings.iHaveAgreeToOur, style: AppTextStyles.poppins400style12),
            TextSpan(
                text: AppStrings.termsAndCondition, style: AppTextStyles.poppins400style12.copyWith(decoration: TextDecoration.underline))
          ]),
        ),
      ],
    );
  }
}
