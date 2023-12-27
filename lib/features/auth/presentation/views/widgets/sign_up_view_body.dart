import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../core/function/navigation.dart';
import 'custom_signup_form.dart';
import 'have_an_account_widget.dart';
import 'welcome_text_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 152)),
          const SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.welcome)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const CustomSignUpForm(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.signIn,
              onTap: () {
                customReplacementNavigate(context, kSignInView);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
