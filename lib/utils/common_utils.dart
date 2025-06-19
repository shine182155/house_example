import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showToast( {required String content,Toast toast = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
    msg: content,
    toastLength: toast,
    gravity: ToastGravity.CENTER,
    fontSize: 14.0,
    backgroundColor: Colors.white,

    textColor: Colors.black,
  );
}
