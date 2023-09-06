import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Sreen2",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Screen@"),
        ),
        body: ElevatedButton(onPressed: (){
          Get.back();
        }, child: Text("Goback")),
      ),
    );
  }
}