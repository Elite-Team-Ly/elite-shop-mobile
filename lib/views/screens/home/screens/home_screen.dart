import 'package:elite_team_training_app/controllers/auth_controller/auth_cubit.dart';
import 'package:elite_team_training_app/controllers/auth_controller/auth_states.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthFailState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.onboarding,
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم تسجيل الخروج بنجاح')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<AuthCubit>().logout();
          },
          child: const Icon(Icons.logout),
        ),
        body: Center(
          child: Text(
            'Welcome to the Home Screen!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
