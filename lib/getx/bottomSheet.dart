import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetG extends StatelessWidget {
  const BottomSheetG({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BottomSheetG",
      home: Scaffold(
        appBar: AppBar(
          title: Text("BottomSheetG"),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(child: Text("BottomSheetG"),
              onPressed: (){
               Get.bottomSheet(
               
                Container(
                  child: Wrap(
                    children: [
                      ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text("Light Theme"),
                      onTap: ()=> {
                        Get.changeTheme(ThemeData.light())
                      },
                      ),
                      ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text("Dark Theme"),
                      onTap: () =>{
                        Get.changeTheme(ThemeData.dark())
                      },

                      ),
                    ],
                  ),
                ),
                // barrierColor: Colors.greenAccent,
               );

              },),
              
            ],
          ),
        ),
      ),
    );
  }
}