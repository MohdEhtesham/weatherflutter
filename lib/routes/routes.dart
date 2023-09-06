import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/getx/DetailScreen.dart';
import 'package:testapp/getx/HomeScreen.dart';



class AppRoutes {
  static const String home = '/';
  static const String settings = '/settings';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: settings, page: () => DetailScreen()),
  ];
}
