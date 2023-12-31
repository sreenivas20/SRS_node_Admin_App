import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

FToast? fToast;

showToast(message) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text(message),
      ],
    ),
  );

  fToast?.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2),
  );

  // Custom Toast Position
  fToast?.showToast(
      child: toast,
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: 16.0,
          left: 16.0,
        );
      });
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(context,message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        color: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.transparent,
  ));
}
