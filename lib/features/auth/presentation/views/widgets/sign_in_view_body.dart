import 'package:flutter/material.dart';

import '../../../../../core/function/navigation.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_signin_form.dart';
import 'have_an_account_widget.dart';
import 'welcom_banner.dart';
import 'welcome_text_widget.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // SliverToBoxAdapter(child: SizedBox(height: 152)),
        const SliverToBoxAdapter(child: WelcomeBanner()),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.welcomeBack)),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomSignInForm(),
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: HaveAnAccountWidget(
            text1: AppStrings.dontHaveAnAccount,
            text2: AppStrings.signUp,
            onTap: () {
              customReplacementNavigate(context, kSignUpView);
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
