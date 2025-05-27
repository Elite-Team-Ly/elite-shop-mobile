// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:elite_team_training_app/controllers/auth_controller/auth_states.dart';
import 'package:elite_team_training_app/models/auth/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isSignedin = false;
  User? userModel;

  void checkSign() async {
    try {
      emit(AuthLoadingState());

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      isSignedin = sharedPreferences.getBool("is_signed_in") ?? false;
      if (isSignedin == true) {
        User user = await getDataFromSharedPref();
        print('Go To Home');
        emit(AuthAuthenticatedState(user));
      } else {
        print('Go To Login');
        emit(AuthUnauthenticatedState());
      }
    } catch (e) {
      print('Error: $e');
      emit(AuthErrorState(e.toString()));
    }
  }

  //get data from sharedPreferences, if the user is Authenticated "signed in".
  Future<User> getDataFromSharedPref() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String data = sharedPreferences.getString("user") ?? '';
    final user = User.fromJson(jsonDecode(data));
    emit(AuthGetUserState(user));
    return user;
  }

  void logout() {
    emit(AuthUnauthenticatedState());
  }
}
