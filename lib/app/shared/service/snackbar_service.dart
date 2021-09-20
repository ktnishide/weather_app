library snackbar_service;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnack(dynamic message) {
  SnackBar snackBar;
  if (message is String) {
    snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    );
  } else {
    snackBar = message as SnackBar;
  }

  if (rootScaffoldMessengerKey.currentState?.mounted ?? false) {
    Timer(const Duration(milliseconds: 500),
        () => rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar));
  } else {
    FlutterError.reportError(FlutterErrorDetails(
        exception:
            'snack bar message not sent: $message , ${rootScaffoldMessengerKey.toString()}',
        stack: StackTrace.current));
  }
}

void hideSnack() {
  rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
}
