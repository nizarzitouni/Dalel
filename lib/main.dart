import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  await getIt<CacheHelper>().init();
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
