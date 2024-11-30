import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/core/utilities/app_themes.dart';
import 'package:salfa_game/injections.dart';
import 'package:salfa_game/provider/app_provider.dart';
import 'package:salfa_game/views/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInj();
  HttpOverrides.global = MyHttpOverrides();
  FlutterError.onError = (FlutterErrorDetails details) {
    log("Error : ${details.exception}");
    log("StackTrace :  ${details.stack}");
  };
  runApp(
    ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => 'لعبة السالفا',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
