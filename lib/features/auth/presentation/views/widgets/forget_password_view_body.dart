import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_forgot_password_form.dart';
import 'package:dalel/features/auth/presentation/views/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

import 'forgot_password_image.dart';
import 'forgot_password_subtitile.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(child: SizedBox(height: 108)),
      SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.forgotPassword)),
      SliverToBoxAdapter(child: SizedBox(height: 40)),
      SliverToBoxAdapter(child: ForgotPasswordImage()),
      SliverToBoxAdapter(child: SizedBox(height: 24)),
      SliverToBoxAdapter(child: ForgotPasswordSubtitile()),
      SliverToBoxAdapter(child: SizedBox(height: 24)),
      SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
    ]);
  }
}
