import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
          child: ElevatedButton(
  onPressed: () {
    Get.toNamed(AppRoutes.settings);
  },
  child: Text('Go to Settings'),
),
      )
    );
  }
}
