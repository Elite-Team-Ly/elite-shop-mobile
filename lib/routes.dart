import 'package:flutter/material.dart';
import 'core/config/routes.dart';
import 'views/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteNames.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case RouteNames.verifyCode:
        return MaterialPageRoute(builder: (_) => const VerifyCodeScreen());

       case RouteNames.customerlogin:
        return MaterialPageRoute(builder: (_) => const CustomerLoginScreen());

        case RouteNames.sellerLogin:
        return MaterialPageRoute(builder: (_) => const SellerLoginScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - الصفحة غير موجودة')),
              ),
        );
    }
  }
}
