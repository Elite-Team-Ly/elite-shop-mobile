import 'package:elite_team_training_app/core/services/app_services.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/config/routes.dart';
import 'core/config/theme.dart';
import 'core/utils/app_notification.dart';
import 'core/utils/set_status_bar_color.dart';
import 'models/auth/otp/OtpModel.dart';
import 'models/auth/sign_in_model.dart';
import 'models/auth/sign_up_model.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar_SA', null);
  await NotificationUtils.requestNotificationPermission();
  await NotificationUtils.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MyApp();
      },
    ),
  );
  final result = await AuthService(ApiService()).signIn(
    SignInModel(phoneNumber: "0928797760", password: "password12345678"),
  );

  result.fold(
        (error) => print('❌ Signin failed: ${error.message} / code:${error.code}'),
        (user) => print('✅ Signed in as: ${user.phone}'),
  );

  // final result = await AuthService(ApiService()).signUp(SignUpModel(name: "name", phone: "0918107760", password: "password", role: Role.customer, gender: "male", birthDate: "2001-12-01", address: Addresses(city: "janzoue", street: "street", latitude: 20.0, longitude: 20.0)));
  //
  // result.fold(
  //       (error) => print('❌ Signup failed: $error'),
  //       (message) => print('✅ $message')
  // );

 // final result = await AuthService(ApiService()).sendOtp(SendOtpModel(phoneNumber: '0928797720', purpose: OtpPurpose.account_creation));
 //  result.fold(
 //        (error) => print('❌  $error'),
 //        (user) => print('✅ $user'),
 //  );

  // final result = await AuthService(ApiService()).verifyOtp(VerifyOtpModel(phoneNumber: '0928797720', code: "00000", purpose: OtpPurpose.password_reset));
  // result.fold(
  //       (error) => print('❌  $error'),
  //       (user) => print('✅ $user'),
  // );
  // final result = await AuthService(ApiService()).resetPassword(ResetPasswordModel(phoneNumber: '0928797720', newPassword: '112233445566'));
  //
  // result.fold(
  //       (error) => print('❌  $error'),
  //       (user) => print('✅ $user'),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      title: 'Elite Shop',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteNames.signin,
      builder: (context, child) {
        setSystemUIStyle(context);
        return child!;
      },
    );
  }
}
