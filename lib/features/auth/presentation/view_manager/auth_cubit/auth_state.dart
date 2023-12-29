// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

// ... Signin States

class SigninLoadingState extends AuthState {}

class SigninSuccessState extends AuthState {}

class SigninFailureState extends AuthState {
  final String errorMessage;
  SigninFailureState({required this.errorMessage});
}

// ... Signup States

class SignupLoadingState extends AuthState {}

class SignupSuccessState extends AuthState {}

class SignupFailureState extends AuthState {
  final String errorMessage;
  SignupFailureState({required this.errorMessage});
}

class TermsAndConditionUpdateState extends AuthState {}

class ObsecurePasswordTextState extends AuthState {}

// ... Forget Pass States

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordFailureState extends AuthState {
  final String errorMessage;
  ResetPasswordFailureState({required this.errorMessage});
}
