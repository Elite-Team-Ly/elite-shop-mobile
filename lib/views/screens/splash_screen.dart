import 'dart:async';
import 'package:elite_team_training_app/controllers/auth_controller/auth_cubit.dart';
import 'package:elite_team_training_app/controllers/auth_controller/auth_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the auth status check immediately when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, authState) {
          if (authState is AuthSuccessState) {
            Timer(
              const Duration(seconds: 4),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.buyerHome,
                (route) => false,
              ),
            );
          } else if (authState is AuthFailState) {
            Timer(
              const Duration(seconds: 4),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.onboarding,
                (route) => false,
              ),
            );
          } else if (authState is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Auth error: ${authState.errorMessage}')),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.onboarding,
              (route) => false,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 46,
                right: 46,
                bottom: 100,
              ),
              child: Image.asset("assets/app/logo.png"),
            ),
            BlocBuilder<AuthCubit, AuthStates>(
              builder: (context, authState) {
                return  SpinKitThreeBounce(
                  color: AppColors.primaryColor,
                  size: 40,
                );
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
          ],
        ),
      ),
    );
  }
}
