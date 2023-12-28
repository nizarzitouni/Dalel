import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              customNavigate(context, kSignUpView);
            },
            icon: const Icon(Icons.signpost_outlined, size: 20),
          ),
        ],
      ),
    );
  }
}
