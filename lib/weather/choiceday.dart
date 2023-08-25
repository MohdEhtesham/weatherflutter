import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testapp/weather/fivedaysinfo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



const String domain = "https://api.openweathermap.org/data/2.5/weather?";
const String apiKey = "1630aa112b284dcbb59ca0e3eaab31dd";

class ChoiceDay extends StatefulWidget {
  final String cityname;
  final Map<String, dynamic> weatherItem;
   ChoiceDay({required this.weatherItem,required this.cityname}); 

  @override
  State<ChoiceDay> createState() => _ChoiceDayState();
}

class _ChoiceDayState extends State<ChoiceDay>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> data = {};
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var timestamp;
  var dateTime;
  String formattedDateTime = "";
  double temperatureCelsius = 0;
  late AnimationController _animationController;
  TextEditingController cityName = TextEditingController();
  bool _isSearching = false;
  var decodeData;
  var lat;
  var lon;
  var cityname ="";

  @override
  void initState() {
    super.initState();

   assignvalue();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
  }

 void assignvalue(){
  setState(() {
    data=widget.weatherItem;
  });
  print("value:$data");
 }
  @override
  void dispose() {
    _animationController.dispose();
    cityName.dispose();
    super.dispose();
  }
 
  String _getBackgroundImage(Map<String, dynamic> data) {
  if (data['weather'] != null && data['weather'][0]['main'] == 'Clear') {
    return 'assets/images/clear.jpg';
  } else if (data['weather'] != null && data['weather'][0]['main'] == 'Clouds') {
    return 'assets/images/cloud.jpg';
  } else if (data['weather'] != null && data['weather'][0]['main'] == 'Rain') {
    return 'assets/images/rain.jpg';
  } else if (data['weather'] != null && data['weather'][0]['main'] == 'Haze') {
    return 'assets/images/haze.jpg';
  }
  else if (data['weather'] != null && data['weather'][0]['main'] == 'Sunny') {
    return 'assets/images/sunny.jpg';
  }else if (data['weather'] != null && data['weather'][0]['main'] == 'Snow') {
    return 'assets/images/snow.jpg';
  }else if (data['weather'] != null && data['weather'][0]['main'] == 'Drizzle') {
    return 'assets/images/drizzle.jpg';
  }else if (data['weather'] != null && data['weather'][0]['main'] == 'Thunderstorm') {
    return 'assets/images/thunderstorm.jpg';
  }
  else if (data['weather'] != null && data['weather'][0]['main'] == 'Mist') {
    return 'assets/images/mist.jpg';
  }
  else if (data['weather'] != null && data['weather'][0]['main'] == 'Smoke') {
    return 'assets/images/smoke.jpg';
  }
  else if (data['weather'] != null && data['weather'][0]['main'] == 'Dust') {
    return 'assets/images/dust.jpg';
  }
  else if (data['weather'] != null && data['weather'][0]['main'] == 'Fog') {
    return 'assets/images/fog.jpg';
  }
   else if (data['weather'] != null && data['weather'][0]['main'] == 'Sand') {
    return 'assets/images/sand.jpg';
  }
    else if (data['weather'] != null && data['weather'][0]['main'] == 'Ash') {
    return 'assets/images/ash.jpg';
  } else if (data['weather'] != null && data['weather'][0]['main'] == 'Squall') {
    return 'assets/images/squall.jpg';
  }else if (data['weather'] != null && data['weather'][0]['main'] == 'Tornado') {
    return 'assets/images/tornado.jpg';
  }
  else {
    return 'assets/images/night.jpg'; 
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
              "",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w900, fontSize: 30),
        ),
      ),
                     
                      
        body: Container(
          child: Stack(
            children: [
              Image.asset(
               _getBackgroundImage(data),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black38),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 120),
                              Text(widget.cityname,
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              Text(
                                data['dt_txt']!=null?data['dt_txt']:"",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  data['main'] != null
                                      ? '${_getTemperatureCelsius(data['main']['temp'])}°C'
                                      : "",
                                  style: TextStyle(
                                    fontSize: 85,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  )),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_half,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      data['weather'] != null &&
                                              data['weather'].isNotEmpty
                                          ? data['weather'][0]['description'] ??
                                              ""
                                          : "",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          height: 1,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Wind",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                                Text(
                                  data['wind'] != null
                                      ? data['wind']['speed'].toString()
                                      : "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "km/h",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white30,
                                    ),
                                    Container(
                                      height: 5,
                                      width: _calculateWindWidth(),
                                      color: Colors.green,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text("Pressure",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                                Text(
                                  data['main'] != null
                                      ? data['main']['pressure'].toString()
                                      : "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "hPa",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white30,
                                    ),
                                    Container(
                                      height: 5,
                                      width: _calculatePressureWidth(),
                                      color: Colors.red,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text("Humidity",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                                Text(
                                  data['main'] != null
                                      ? data['main']['humidity'].toString()
                                      : '',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white30,
                                    ),
                                    Container(
                                      height: 5,
                                      width: _calculateHumidityWidth(),
                                      color: Colors.green,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  String _getTemperatureCelsius(double temperatureKelvin) {
    return (temperatureKelvin - 273.15).toStringAsFixed(1);
  }

  double _calculateWindWidth() {
    if (data['wind'] != null && data['wind']['speed'] != null) {
      double windSpeed = data['wind']['speed'].toDouble(); // Convert to double
      double maxWindSpeed =
          20.0; // Maximum wind speed in km/h (adjust this based on your range)
      double maxWidth = 50; // Maximum width for the second Container

      double windSpeedPercentage = (windSpeed / maxWindSpeed)
          .clamp(0.0, 1.0); // Calculate the percentage
      return windSpeedPercentage *
          maxWidth; // Calculate the width based on wind speed percentage
    }

    return 0; // Default width if wind speed data is unavailable
  }

  double _calculatePressureWidth() {
    if (data['main'] != null && data['main']['pressure'] != null) {
      double pressure =
          data['main']['pressure'].toDouble(); // Convert to double
      double maxPressure =
          1050; // Maximum pressure in hPa (adjust this based on your range)
      double maxWidth = 50; // Maximum width for the second Container

      double pressurePercentage =
          (pressure / maxPressure).clamp(0.0, 1.0); // Calculate the percentage
      return pressurePercentage *
          maxWidth; // Calculate the width based on pressure percentage
    }

    return 0; // Default width if pressure data is unavailable
  }

  double _calculateHumidityWidth() {
    if (data['main'] != null && data['main']['humidity'] != null) {
      double humidity = data['main']['humidity'] /
          100; // Convert to a percentage value between 0 and 1
      double maxWidth = 50; // Maximum width for the second Container

      return humidity * maxWidth; // Calculate the width based on humidity
    }

    return 0; // Default width if humidity data is unavailable
  }
}
