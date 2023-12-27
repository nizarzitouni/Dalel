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

  var obscurePasswordTextValue;

  bool? termsAndConditionCheckBoxValue = false;

  AuthCubit() : super(AuthInitial());

  Future<void> loginUser({required String email, required String password}) async {
    emit(SiginLoadingState());
    try {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          emit(SiginFailureState(errorMessage: 'user-not-found'));
        } else if (ex.code == 'wrong-password') {
          emit(SiginFailureState(errorMessage: 'wrong-password'));
        }
      } catch (ex) {
        emit(SiginFailureState(errorMessage: 'Exception: ${ex.toString()}'));
      }
      emit(SiginSuccessState());
    } on Exception catch (e) {
      emit(SiginFailureState(errorMessage: 'Somthing went wrong: ${e.toString()}'));
    }
  }

  Future<void> signUpWithEmailAndPasword() async {
    emit(SignupLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddress!, password: password!);
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

  void obscurePasswordText() {}

  void updateTermsAndConditionCheckBox({required bool newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }
}
