import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customReplacementNavigate(context, kSignInView);
            },
            icon: const Icon(Icons.signpost_outlined, size: 20),
          ),
        ],
      ),
      body: const Center(child: Text('Home')),
    );
  }
}
