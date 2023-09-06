import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/getx/student.dart';
import 'package:testapp/getx/my_controller.dart';

class ControllerG extends StatelessWidget {
final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "State Management",
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Management"),
        ),
        body:Column(
          children: [
            // Obx(() => Text('Count: ${_controller.student.name}')),
            // ElevatedButton(onPressed: (){
            //   _controller.convertToUpperCase();
            // }, child: Text("Upper Case"))
            GetBuilder<MyController>(
              // id: 'txt1',
              builder:(controller){
                return Text("The value is ${controller.count}");
              } ),
               GetBuilder<MyController>(
              
              builder:(controller){
                return Text("The value is ${controller.count}");
              } ),

            ElevatedButton(onPressed: (){
             _controller.increment();
            }, child: Text("Increment"))
            
          ],
        ) ,
      ),
    );
  }
}