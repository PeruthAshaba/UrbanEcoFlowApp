import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/state.dart';
import '../models/user_model.dart';
import '../pages/Homepage.dart';
import '../services/user_service.dart';

final userProvider =
    StateNotifierProvider<_UserNotifier, AppState<UserModel>>((ref) {
  return _UserNotifier();
});

class _UserNotifier extends StateNotifier<AppState<UserModel>> {
  _UserNotifier() : super(AppState(status: Status.initial));
  login(String email, String password) async {
    state = state.copyWith(status: Status.loading);
    var data = await UserService.login(email, password);
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) => state = state.copyWith(status: Status.loaded, data: r));
  }

  register(
      {required String email,
      required String password,
      required String username}) async {
    state = state.copyWith(status: Status.loading);
    var data = await UserService.register(
        email: email, password: password, username: username);
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) => state = state.copyWith(status: Status.loaded, data: r));
  }

  getUserData(BuildContext context) async {
    state = state.copyWith(status: Status.loading);
    var data = await UserService.getUserData();
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) {
      state = state.copyWith(status: Status.loaded, data: r);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }
}

final passwordRecoveryProvider =
    StateNotifierProvider<_PasswordRecoveryNotifier, AppState<String>>((ref) {
  return _PasswordRecoveryNotifier();
});

class _PasswordRecoveryNotifier extends StateNotifier<AppState<String>> {
  _PasswordRecoveryNotifier() : super(AppState(status: Status.initial));
  login(String email) async {
    state = state.copyWith(status: Status.loading);
    var data = await UserService.passwordRecovery(email);
    data.fold((l) => state = state.copyWith(status: Status.error, message: l),
        (r) => state = state.copyWith(status: Status.loaded, data: r));
  }
}