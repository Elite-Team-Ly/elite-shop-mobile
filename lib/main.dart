import 'package:elite_team_training_app/views/screens/signUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/config/theme.dart';
import 'core/utils/app_notification.dart';
import 'core/utils/setStatusBarColor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar_SA', null);

  await NotificationUtils.requestNotificationPermission();
  await NotificationUtils.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      title: 'Elite Shop',
      home: const SignupScreen(),
      builder: (context, child) {
        setSystemUIStyle(context);
        return child!;
      },
    );
  }
}
