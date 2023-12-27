import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import '../../../../../core/function/navigation.dart';
import 'custom_text_field.dart';
import 'have_an_account_widget.dart';
import 'terms_and_condition_widget.dart';
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
          const SliverToBoxAdapter(child: CustomTextFormField(labelText: AppStrings.fristName)),
          const SliverToBoxAdapter(child: CustomTextFormField(labelText: AppStrings.lastName)),
          const SliverToBoxAdapter(child: CustomTextFormField(labelText: AppStrings.emailAddress)),
          const SliverToBoxAdapter(child: CustomTextFormField(labelText: AppStrings.password)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: TermsAndCondtionWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 88)),
          SliverToBoxAdapter(
              child: CustomBtn(
            text: AppStrings.signUp,
            onPressed: () {},
          )),
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
        ],
      ),
    );
  }
}
