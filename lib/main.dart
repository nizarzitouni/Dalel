import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/dalel.dart';
import 'core/function/check_auth_state.dart';
import 'firebase_options.dart';

import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  checkAuthState();
  await getIt<CacheHelper>().init();
  runApp(const Dalel());
}
