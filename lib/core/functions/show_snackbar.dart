import 'package:flutter/material.dart';
import 'package:salfa_game/core/utilities/app_routes.dart';

showSnackbar(String message, {bool error = false}) {
  closeSnackbar();

  ScaffoldMessenger.of(AppNavigator.context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textDirection: true ? TextDirection.rtl : TextDirection.ltr,
      ),
      backgroundColor: error ? Colors.red : Colors.green,
    ),
  );
}

closeSnackbar() {
  ScaffoldMessenger.of(AppNavigator.context).clearSnackBars();
}
