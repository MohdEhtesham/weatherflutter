import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DialogG extends StatelessWidget {
  const DialogG({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dialog",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
          
        ),
        body: ElevatedButton(child:Text("Dialog Box"),
        onPressed: () {
        //  Get.defaultDialog();
         Get.defaultDialog(
                    title: "Welcome to Flutter Dev'S",
                    middleText: "FlutterDevs is a protruding flutter app development company with "
                        "an extensive in-house team of 30+ seasoned professionals who know "
                        "exactly what you need to strengthen your business across various dimensions",
                    backgroundColor: Colors.teal,
                    titleStyle: TextStyle(color: Colors.white),
                    middleTextStyle: TextStyle(color: Colors.white),
                    radius: 30
                    //other so many property is available .
                  );
        },
        ),
      ),
    );
  }
}