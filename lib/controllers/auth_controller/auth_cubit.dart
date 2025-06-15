// ignore_for_file: avoid_print

import 'package:elite_team_training_app/controllers/auth_controller/auth_states.dart';
import 'package:elite_team_training_app/core/services/local_storage_service.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/auth/sign_in_model.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthService authService; // Inject AuthService
  final LocalStorageService localStorageService; // Inject LocalStorageService

  User? _currentUser; // Keep track of the current user in memory

  AuthCubit(this.authService, this.localStorageService)
    : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  User? get currentUser => _currentUser;

    Future<void> checkAuthStatus() async {
    emit(AuthLoadingState());
    try {
      final token = LocalStorageService.getToken();
      final userDataMap = LocalStorageService.getUserData();

      if (token != null && userDataMap != null) {
        // We have a token and user data locally.
        // Convert the stored map back to your User model.
        _currentUser = User.fromJson(userDataMap);
        emit(AuthSuccessState(_currentUser!));
      } else {
        // No token or user data, user is not authenticated
        emit(AuthFailState());
      }
    } catch (e) {
      print('AuthCubit Error checking auth status: $e');
      emit(AuthErrorState("Failed to check authentication status."));
    }
  }

  // Method called when a user successfully signs in (from SignInCubit)
  Future<void> onSuccessfulSignIn(User user, String token) async {
    try {
      _currentUser = user;
      emit(AuthSuccessState(user));
    } catch (e) {
      print('AuthCubit Error onSuccessfulSignIn: $e');
      emit(AuthErrorState('Failed to establish user session.'));
    }
  }

 
  Future<void> onSuccessfulSignUp(User user, String token) async {
    await onSuccessfulSignIn(user, token); // Reuse sign-in logic
  }


  // Logout logic
  Future<void> logout() async {
    emit(AuthLoadingState());
    try {
      await LocalStorageService.clearToken();
      await LocalStorageService.clearUserData();
      _currentUser = null;
      emit(AuthFailState());
    } catch (e) {
      print('AuthCubit Error during logout: $e');
      emit(AuthErrorState('Failed to log out. Please try again.'));
    }
  }
}


