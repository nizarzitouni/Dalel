import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  bool obscurePasswordTextValue = true;
  bool termsAndConditionCheckBoxValue = false;

  AuthCubit() : super(AuthInitial());

// ... Sign In Funcs --------------------------

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

// ... Signup Funcs --------------------------

  Future<void> signUpWithEmailAndPasword() async {
    emit(SignupLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddress!, password: password!);
      addUserProfile();
      verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(SignupFailureState(errorMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignupFailureState(errorMessage: 'email-already-in-use'));
      } else if (ex.code == 'invalid-email') {
        emit(SignupFailureState(errorMessage: 'The email is invalid'));
      } else {
        emit(SignupFailureState(errorMessage: ex.code));
      }
    } catch (ex) {
      emit(SignupFailureState(errorMessage: 'Exception: ${ex.toString()}'));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void obscurePasswordText() {
    obscurePasswordTextValue = !obscurePasswordTextValue;
    emit(ObsecurePasswordTextState());
  }

  void updateTermsAndConditionCheckBox({required bool newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": emailAddress,
      "frist_name": fristName,
      "last_name": lastName,
    });
  }

// ... Forget Pass Funcs --------------------------

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errorMessage: e.toString()));
    }
  }
}
