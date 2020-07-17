import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(
      {@required String msg, Duration duration: const Duration(seconds: 3)}) {
    Scaffold.of(this).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        )),
        content: Text(msg),
        duration: duration,
      ),
    );
  }
}
