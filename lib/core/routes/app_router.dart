import 'package:dalel/features/auth/presentation/view_manager/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forget_password_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/presentation/views/home_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';

const kSplashView = '/';
const kOnBoardingView = '/onBoarding';
const kSignInView = '/signIn';
const kSignUpView = '/signUp';
const kforgetPasswordView = '/forgotPassword';
const kHomeView = '/home';
const kHomeNavBarView = '/homeNavBar';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kSignInView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kforgetPasswordView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(
        path: kHomeNavBarView,
        builder: (context, state) => HomeNavBar(),
      ),
    ],
  );
}
