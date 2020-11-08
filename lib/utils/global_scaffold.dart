import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();
  final scaffKey = GlobalKey<ScaffoldState>();
  void showSnack(SnackBar snackBar) {
    scaffKey.currentState.showSnackBar(snackBar);
  }
}
