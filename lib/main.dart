import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/get_it.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/app_router.dart';
import 'fitrix_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  // await Prefs.init();
  // await Hive.initFlutter();

  // final firebaseNotificationsService = di<NotificationService>();
  // await firebaseNotificationsService.initNotifications().timeout(
  //   const Duration(seconds: 3),
  //   onTimeout: () {
  //     log("❌ Firebase notifications initialization timed out.");
  //     return null;
  //   },
  // );
  // final token = await di<FirebaseTokenService>().handleToken();
  // if (token != null) {
  //   log("🔥 Token on app start: $token");
  // }
  // log("❌${Prefs.getData(key: Constants.userToken)}");

  runApp(
    DevicePreview(
      // enabled: kDebugMode,
      enabled: false,
      builder: (context) {
        return FitrixApp(appRouter: AppRouter());
      },
    ),
  );
}
