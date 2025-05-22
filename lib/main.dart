import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/config/theme.dart';
import 'core/utils/app_notification.dart';
import 'core/utils/setStatusBarColor.dart';
import 'views/onBoarding_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      home: const OnboardingScreen(),
      builder: (context, child) {
        setSystemUIStyle(context);
        return child!;
      },
    );
  }
}
