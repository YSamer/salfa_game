import 'dart:developer';

import 'package:flutter/material.dart';

export 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider() {
    Future.delayed(const Duration(milliseconds: 2000), () async {
      try {
        _authUserResult = true;
      } catch (e) {
        log(e.toString());
        _authUserResult = false;
      }
      notifyListeners();
    });
  }

  bool? _authUserResult;
  bool? get authUserResult => _authUserResult;
}
