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



/*
Github: https://github.com/HappyTechChannel/dalel
Current vid: 33
Youtube:https://www.youtube.com/watch?v=tWXaPR6Nf0A&list=PLW3uJGWFOnbGIjNo0zxeOzmTYnWlpPczR&index=34
Figma: https://www.figma.com/file/rDL7yYQ3uH0GI45w4h0x5j/Dalel?type=design&node-id=0-1&mode=design&t=naGKspxSsLBrgMET-0 
Cloud Doc:https://firebase.flutter.dev/docs/firestore/usage/
*/
