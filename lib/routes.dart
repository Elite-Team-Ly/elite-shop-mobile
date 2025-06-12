import 'package:elite_team_training_app/controllers/otp_controller/otp_cubit.dart';
import 'package:elite_team_training_app/controllers/reset_password_controller/reset_password_cubit.dart';
import 'package:elite_team_training_app/core/services/locator.dart';
import 'package:elite_team_training_app/core/utils/navigation_transitions.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
import 'package:elite_team_training_app/views/screens/auth/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/sign_in_controller.dart/sign_in_cubit.dart';
import 'package:elite_team_training_app/controllers/sign_up_controller/sign_up_cubit.dart';
import 'core/config/routes.dart';
import 'views/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.onboarding:
        return slideRoute(const OnboardingScreen());

      case RouteNames.signin:
        return slideRoute(SignInScreen());

      case RouteNames.signup:
        return slideRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => SignupCubit(locator<AuthService>())),
              BlocProvider(create: (context) => OtpCubit(locator<AuthService>())),
            ],
            child: const SignUpScreen(),
          ),
        );
      case RouteNames.resetPassword: //this is the screen to write phone number
        return slideRoute(
          BlocProvider(
            create: (context) => OtpCubit(locator<AuthService>()),
            child: const ResetPassword(),
          ),
        );
      case RouteNames.verifyCode: // this is the screen to verify the code
        // Extract arguments
        final args = settings.arguments;

        if (args is Map<String, dynamic> &&
            args.containsKey('otpCubit') && // Check for the cubit key
            args.containsKey('phoneNumber') &&
            args.containsKey('purpose')) {
          // Ensure the types are correct before casting
          final OtpCubit receivedCubit = args['otpCubit'] as OtpCubit;
          final String receivedPhoneNumber = args['phoneNumber'] as String;
          final OtpPurpose receivedPurpose = args['purpose'] as OtpPurpose;

          return slideRoute(
            VerifyCodeScreen(
              otpCubit: receivedCubit, // Pass the received Cubit
              phoneNumber: receivedPhoneNumber,
              purpose: receivedPurpose,
            ),
          );
        }
        // Handle cases where arguments are missing or incorrect
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(
                  child: Text(
                    'Error: Missing or invalid arguments for Verify Code Screen',
                  ),
                ),
              ),
        );

      case RouteNames.newPassword: //this is the screen to write new password
        final args = settings.arguments;
        if (args is Map<String, dynamic> &&
            args.containsKey('phoneNumber') &&
            args.containsKey('purpose')) {
          final String receivedPhoneNumber = args['phoneNumber'] as String;
          final OtpPurpose receivedPurpose = args['purpose'] as OtpPurpose;
          return slideRoute(
            BlocProvider(
              create: (context) => ResetPasswordCubit(locator<AuthService>()),
              child: NewPasswordScreen(
                phoneNumber: receivedPhoneNumber,
                purpose: receivedPurpose,
              ),
            ),
          );
        } else {
          // Handle cases where arguments are missing or incorrect
          return MaterialPageRoute(
            builder:
                (_) => const Scaffold(
                  body: Center(
                    child: Text(
                      'Error: Missing or invalid arguments for New Password Screen',
                    ),
                  ),
                ),
          );
        }
      case RouteNames.customerLogin:
        return slideRoute(
          BlocProvider(
            create: (_) => SignInCubit(locator<AuthService>()),
            child: const CustomerLoginScreen(),
          ),
        );

      case RouteNames.sellerLogin:
        return slideRoute(
          BlocProvider(
            create: (_) => SignInCubit(locator<AuthService>()),
            child: const SellerLoginScreen(),
          ),
        );

      default:
        return slideRoute(
          const Scaffold(body: Center(child: Text('404 - الصفحة غير موجودة'))),
        );
    }
  }
}
