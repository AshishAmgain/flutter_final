import 'dart:io';

import 'package:hotel_book/core/common/my_snackbar.dart';
import 'package:hotel_book/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_book/features/auth/domain/use_case/auth_use_case.dart';
import 'package:hotel_book/features/auth/presentation/navigator/login_navigator.dart';
import 'package:hotel_book/features/auth/presentation/navigator/register_navigator.dart';
import 'package:hotel_book/features/auth/presentation/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
    (ref) => AuthViewModel(
        (ref.read(loginViewNavigatorProvider)),
        ref.read(registerViewNavigatorProvider),
        ref.read(authUserCaseProvider)));

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.loginNavigator, this.signupNavigator, this.authUseCase)
      : super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator loginNavigator;
  final RegisterNavigator signupNavigator;

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.uploadProfilePicture(file!);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    }, (imageName) {
      state =
          state.copyWith(isLoading: false, error: null, imageName: imageName);
    });
  }

  Future<void> registerUser(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(user);
    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showMySnackBar(message: failure.error.toString(), color: Colors.red);
    }, (success) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: "register successfully", color: Colors.green);
      openLoginView();
    });
  }

  Future<void> loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      showMySnackBar(message: failure.error, color: Colors.red);
    }, (success) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: "Login Successfully", color: Colors.green);
      openDashBoard();
    });
  }

  void openRegisterView() {
    loginNavigator.openRegisterView();
  }

  void openLoginView() {
    signupNavigator.openLoginView();
  }

  void openDashBoard() {
    loginNavigator.openDashBoardView();
  }
}
