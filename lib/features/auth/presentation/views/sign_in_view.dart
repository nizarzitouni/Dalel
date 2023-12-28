import 'package:flutter/material.dart';

import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignInViewBody());
  }
}
