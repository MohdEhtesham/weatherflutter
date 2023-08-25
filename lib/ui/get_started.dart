import 'package:flutter/material.dart';
import 'package:testapp/models/constants.dart';
import 'package:testapp/ui/home.dart';
import 'package:testapp/ui/welcome.dart';


class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    Constants myConstatnts = Constants();
    Size size =MediaQuery.of(context).size ;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Weather App"),
      // ),

      body: Container(
        width: size.width,
        height: size.height,
        color: myConstatnts.primaryColor.withOpacity(.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/nature.png'),
              GestureDetector(
                onTap: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Home()));
                },
                child: Container(
                  height: size.height*0.08,
                  width: size.width*0.8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 4, 94, 33),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(child: Text('Get Started',  style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}