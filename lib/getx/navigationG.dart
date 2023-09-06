import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/getx/screen2.dart';

class NavigationG extends StatelessWidget {
  const NavigationG({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "NavigationG",
      home: Scaffold(
        appBar: AppBar(
          title: Text("NavigationG"),

        ),
        body: ElevatedButton(onPressed: (){
          Get.to(()=>Screen2());
        }, child: Text("Go to screen2")),
      ),
    );
  }
}