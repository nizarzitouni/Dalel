import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;

  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();

  bool obscurePasswordTextValue = true;
  bool termsAndConditionCheckBoxValue = false;

  AuthCubit() : super(AuthInitial());

  Future<void> sigInWithEmailAndPassword() async {
    emit(SigninLoadingState());
    try {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress!, password: password!);
        emit(SigninSuccessState());
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          emit(SigninFailureState(errorMessage: 'user-not-found'));
        } else if (ex.code == 'wrong-password') {
          emit(SigninFailureState(errorMessage: 'wrong-password'));
        }
      } catch (ex) {
        emit(SigninFailureState(errorMessage: 'Exception: ${ex.toString()}'));
      }
    } on Exception catch (e) {
      emit(SigninFailureState(errorMessage: 'Somthing went wrong: ${e.toString()}'));
    }
  }

  Future<void> signUpWithEmailAndPasword() async {
    emit(SignupLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddress!, password: password!);
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(SignupFailureState(errorMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignupFailureState(errorMessage: 'email-already-in-use'));
      }
    } catch (ex) {
      emit(SignupFailureState(errorMessage: 'Exception: ${ex.toString()}'));
    }
  }

  void obscurePasswordText() {
    obscurePasswordTextValue = !obscurePasswordTextValue;
    emit(ObsecurePasswordTextState());
  }

  void updateTermsAndConditionCheckBox({required bool newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }
}
