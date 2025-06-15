import 'package:elite_team_training_app/core/utils/navigation_transitions.dart';
import 'package:elite_team_training_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/sign_in_controller.dart/sign_in_cubit.dart';
import 'package:elite_team_training_app/controllers/sign_up_controller/sign_up_cubit.dart';
import 'core/config/routes.dart';
import 'views/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteNames.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.onboarding:
        return slideRoute(const OnboardingScreen());

      case RouteNames.signin:
        return slideRoute(SignInScreen());

      case RouteNames.signup:
        return slideRoute(
          BlocProvider(
            create: (_) => SignupCubit(),
            child: const SignUpScreen(),
          ),
        );

      case RouteNames.verifyCode:
        return slideRoute(const VerifyCodeScreen());

      case RouteNames.resetPassword:
        return slideRoute(const ResetPassword());

      case RouteNames.customerLogin:
        return slideRoute(
          BlocProvider(
            create: (_) => SignInCubit(),
            child: const CustomerLoginScreen(),
          ),
        );

      case RouteNames.sellerLogin:
        return slideRoute(
          BlocProvider(
            create: (_) => SignInCubit(),
            child: const SellerLoginScreen(),
          ),
        );

      case RouteNames.home:
        return slideRoute(const HomeScreen());

      default:
        return slideRoute(
          const Scaffold(body: Center(child: Text('404 - الصفحة غير موجودة'))),
        );
    }
  }
}
