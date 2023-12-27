// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class SigInLoading extends AuthState {}

class SigInSuccess extends AuthState {}

class SigInFailure extends AuthState {
  final String errorMessage;
  SigInFailure({required this.errorMessage});
}

class SigUpLoading extends AuthState {}

class SigUpSuccess extends AuthState {}

class SigUpFailure extends AuthState {
  final String errorMessage;
  SigUpFailure({required this.errorMessage});
}
