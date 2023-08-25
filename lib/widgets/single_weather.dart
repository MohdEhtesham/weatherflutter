// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:testapp/models/weather_locations.dart';
// import 'package:testapp/widgets/single_weather.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// const String domain = "https://api.openweathermap.org/data/2.5/weather?";
// const String apiKey = "1630aa112b284dcbb59ca0e3eaab31dd";


// class SingleWeather extends StatefulWidget {
// Map<String, dynamic>? decodeData;
// SingleWeather(this.decodeData);

//   @override
//   State<SingleWeather> createState() => _SingleWeatherState();
// }

// class _SingleWeatherState extends State<SingleWeather> {
 

//   @override
//   void initState() {
//     super.initState();
   
//     if (widget.decodeData != null) {
//     data = widget.decodeData!; // Initialize data with the passed weather data
//     // ... rest of your initState code
//   }
    
//   }

 
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 120),
//                     Text(
//                       data['name'] ?? "",
//                         style: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         )),
//                     Text(
//                       '${formattedDateTime}',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                         data['main'] != null
//                             ? '${_getTemperatureCelsius(data['main']['temp'])}°C'
//                             : "",
//                         style: TextStyle(
//                           fontSize: 85,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.white,
//                         )),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.star_half,
//                           size: 30,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           data['weather'] != null && data['weather'].isNotEmpty
//                               ? data['weather'][0]['description'] ?? ""
//                               : "",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 40),
//                 height: 1,
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.white)),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text("Wind",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           )),
//                       Text(
//                         data['wind'] != null
//                             ? data['wind']['speed'].toString()
//                             : "",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "km/h",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Stack(
//                         children: [
//                           Container(
//                             height: 5,
//                             width: 50,
//                             color: Colors.white30,
//                           ),
//                           Container(
//                             height: 5,
//                             width: _calculateWindWidth(),
//                             color: Colors.green,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("Pressure",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           )),
//                       Text(
//                         data['main']!=null?
//                         data['main']['pressure'].toString():"",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "hPa",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Stack(
//                  children: [
//                           Container(
//                             height: 5,
//                             width: 50,
//                             color: Colors.white30,
//                           ),
//                           Container(
//                             height: 5,
//                             width:_calculatePressureWidth(),
//                             color: Colors.red,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("Humidity",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           )),
//                       Text(
//                         data['main']!=null?
//                         data['main']['humidity'].toString():'',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "%",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Stack(
//                         children: [
//                           Container(
//                             height: 5,
//                             width: 50,
//                             color: Colors.white30,
//                           ),
//                           Container(
//                             height: 5,
//                             width: _calculateHumidityWidth(),
//                             color: Colors.green,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
  
//   }

//   String _getTemperatureCelsius(double temperatureKelvin) {
//     return (temperatureKelvin - 273.15).toStringAsFixed(1);
//   }
//   double _calculateHumidityWidth() {
//   if (data['main'] != null && data['main']['humidity'] != null) {
//     double humidity = data['main']['humidity'] / 100; // Convert to a percentage value between 0 and 1
//     double maxWidth = 50; // Maximum width for the second Container
    
//     return humidity * maxWidth; // Calculate the width based on humidity
//   }
  
//   return 0; // Default width if humidity data is unavailable
// }

// double _calculatePressureWidth() {
//   if (data['main'] != null && data['main']['pressure'] != null) {
//     double pressure = data['main']['pressure'].toDouble(); // Convert to double
//     double maxPressure = 1050; // Maximum pressure in hPa (adjust this based on your range)
//     double maxWidth = 50; // Maximum width for the second Container
    
//     double pressurePercentage = (pressure / maxPressure).clamp(0.0, 1.0); // Calculate the percentage
//     return pressurePercentage * maxWidth; // Calculate the width based on pressure percentage
//   }
  
//   return 0; // Default width if pressure data is unavailable
// }

// double _calculateWindWidth() {
//   if (data['wind'] != null && data['wind']['speed'] != null) {
//     double windSpeed = data['wind']['speed'].toDouble(); // Convert to double
//     double maxWindSpeed = 20.0; // Maximum wind speed in km/h (adjust this based on your range)
//     double maxWidth = 50; // Maximum width for the second Container
    
//     double windSpeedPercentage = (windSpeed / maxWindSpeed).clamp(0.0, 1.0); // Calculate the percentage
//     return windSpeedPercentage * maxWidth; // Calculate the width based on wind speed percentage
//   }
  
//   return 0; // Default width if wind speed data is unavailable
// }



// }
