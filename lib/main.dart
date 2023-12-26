import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';

void main() {
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
