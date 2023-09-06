import 'package:get/get.dart';
import 'package:testapp/getx/student.dart';


class MyController extends GetxController{

 
  var student=Student();

  void convertToUpperCase(){
    student.name.value=student.name.value.toUpperCase();

  }
  var count =0;
  void increment(){
    count++;
    // update(['txt1']);
    update();
  }
}