import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/get_it.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theming/app_colors.dart';
import 'generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

class FitrixApp extends StatelessWidget {
  final AppRouter appRouter;

  const FitrixApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        title: 'FitrixApp',
        theme: ThemeData(
          primaryColor: ColorsManager.primaryGreen,
          scaffoldBackgroundColor: Colors.white,
          // fontFamily: GoogleFonts.cairo().fontFamily,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
