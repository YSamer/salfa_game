import 'package:flutter/material.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';
import 'package:salfa_game/provider/splash/splash_provider.dart';
import 'package:salfa_game/views/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(),
      builder: (context, child) => Consumer<SplashProvider>(
        builder: (context, provider, child) {
          if (provider.authUserResult == true) {
            Future.microtask(
              () => context.mounted
                  ? AppRoutes.routeRemoveTo(context, const HomePage())
                  : null,
            );
          } else if (provider.authUserResult == false) {
            Future.microtask(
              () => context.mounted
                  ? AppRoutes.routeRemoveTo(context, const HomePage())
                  : null,
            );
          }
          return const Scaffold(
            body: Center(
              child: FlutterLogo(),
            ),
          );
        },
      ),
    );
  }
}
