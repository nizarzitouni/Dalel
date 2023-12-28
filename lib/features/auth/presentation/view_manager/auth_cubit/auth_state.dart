// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class SiginLoadingState extends AuthState {}

class SiginSuccessState extends AuthState {}

class SiginFailureState extends AuthState {
  final String errorMessage;
  SiginFailureState({required this.errorMessage});
}

class SignupLoadingState extends AuthState {}

class SignupSuccessState extends AuthState {}

class SignupFailureState extends AuthState {
  final String errorMessage;
  SignupFailureState({required this.errorMessage});
}

class TermsAndConditionUpdateState extends AuthState {}

class ObsecurePasswordTextState extends AuthState {}
