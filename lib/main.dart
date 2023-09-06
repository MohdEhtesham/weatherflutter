import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/home/HomeView.dart';
import 'package:testapp/getx/barcode.dart';
import 'package:testapp/getx/bottomSheet.dart';
import 'package:testapp/getx/controllerg.dart';
import 'package:testapp/getx/imagepicker.dart';
import 'package:testapp/getx/reactive.dart';
import 'package:testapp/routes/routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation with Get Package',
      // initialRoute: AppRoutes.home,
      // getPages: AppRoutes.routes,
      home: BarcodeScannerDemo(),
    );
  }
}

