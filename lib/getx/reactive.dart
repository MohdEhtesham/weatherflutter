import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveData extends StatelessWidget {
  
  var count = 0.obs;
   void increment() {
    count.value++;
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DerivedData",
      home: Scaffold(
      appBar: AppBar(
        title: Text("ReactiveData"),
      ),
      body: Column(children: [
     Obx(() => Text('Count: ${count.value}')),
     ElevatedButton(onPressed: (){
      increment();
     }, child:Text("Increment"))
      ]),
    ),
    );
  }
}