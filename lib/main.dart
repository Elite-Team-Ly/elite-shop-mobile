import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'controllers/auth_controller/auth_cubit.dart';
import 'core/config/routes.dart';
import 'core/config/theme.dart';
import 'core/services/local_storage_service.dart';
import 'core/services/locator.dart';
import 'core/utils/app_notification.dart';
import 'core/utils/set_status_bar_color.dart';
import 'routes.dart';
import 'bloc_obs.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initializeDateFormatting('ar_SA', null);
  await NotificationUtils.requestNotificationPermission();
  await NotificationUtils.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setupLocator();

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
  await LocalStorageService.init();
  //
  //  final result = await AddressService(ApiService()).getAllDistricts();
  //
  //  result.fold((ifLeft){
  //    print(ifLeft.message);
  //  }, (ifRight) async {
  //    await LocalStorageService.saveDistrictToLocal(ifRight.data);
  //
  //  });
  // final ci =await LocalStorageService.getDistrictFromLocal();
  // print(ci[0].name);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => locator<AuthCubit>()..checkAuthStatus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: baseTheme,
        title: 'Elite Shop',
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RouteNames.splash,
        builder: (context, child) {
          setSystemUIStyle(context);
          return child!;
        },
      ),
    );
  }
}
