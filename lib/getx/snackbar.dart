import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar extends StatelessWidget {
  const Snackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Snackbar"),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(child: Text("Snackbar"),
              onPressed: (){
                Get.snackbar("SnackBar", "This will be a snackbar message",
                backgroundColor: Colors.black,
                colorText: Colors.white,
                //So many properties of snackbar can be apply here              
                );

              },),
            ],
          ),
        ),
      ),
    );
  }
}