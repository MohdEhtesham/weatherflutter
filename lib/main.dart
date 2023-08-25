
import 'package:flutter/material.dart';
import 'package:testapp/weather/weatherapp.dart';



void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home:WeatherApp(),
    
    );
  }
}




