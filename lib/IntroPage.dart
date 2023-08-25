// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:testapp/main.dart';

// class IntroPage extends StatefulWidget {
//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }

// class _IntroPageState extends State<IntroPage> {
//   var weightvalue =TextEditingController();
//   var feetValue =TextEditingController();
//   var inchvalue =TextEditingController();
//   var resultvalue = "" ;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Intro"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: weightvalue,
//                     decoration: InputDecoration(
//                         label: Text("Enter your weight (in Kg)"),
//                         prefixIcon: Icon(Icons.line_weight)),
//                     keyboardType: TextInputType.number,
//                   ),
//                   TextField(
//                     controller: feetValue,
//                     decoration: InputDecoration(
                      
//                         label: Text("Enter your Height (in Feet)"),
//                         prefixIcon: Icon(Icons.height)),
//                     keyboardType: TextInputType.number,
//                   ),
//                   TextField(
//                     controller: inchvalue,
//                     decoration: InputDecoration(
//                         label: Text("Enter your Inch (in inch)"),
//                         prefixIcon: Icon(Icons.height)),
//                     keyboardType: TextInputType.number,
//                   ),
//                   ElevatedButton(onPressed: (){
//                    var we = weightvalue.text.toString();
//                    var fe=feetValue.text.toString();
//                    var ich =inchvalue.text.toString();
//                     if(we !="" && fe !="" && ich !=""){
//                       // ignore: unused_local_variable
//                       var iw=int.parse(we);
//                       var infe=int.parse(fe);
//                       var inin=int.parse(ich);
//                     var heightinch = (infe*12) +inin ;
//                     var heightincm =(heightinch*2.54);
//                     var heightmeter =(heightincm/100);
//                     var bmivalue =iw/(heightmeter*heightmeter);
                  
//                       setState(() {
//                         resultvalue =' Your Bmi is $bmivalue' ;
//                       });


//                     }
//                     else{
//                      setState(() {
//                        resultvalue ='Please inter all required value';
//                      });
//                     }
//                   }, child: Text('Calclate'))
//                 ],
//               ),
//             ),
            
//             Text('$resultvalue'),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //     context,
//                   //     // MaterialPageRoute(
//                   //     //   // builder: (context) => HomePage(),
//                   //     // ));
//                 },
//                 child: Text('Next............'))
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:testapp/models/weather_locations.dart';
// import 'package:testapp/widgets/single_weather.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';



// class WeatherApp extends StatefulWidget {
//   const WeatherApp({Key? key}) : super(key: key);

//   @override
//   State<WeatherApp> createState() => _WeatherAppState();
// }

// class _WeatherAppState extends State<WeatherApp> with SingleTickerProviderStateMixin {
 
//   late AnimationController _animationController;
//   TextEditingController cityName = TextEditingController();
//   bool _isSearching = false;
  
//   @override
//   void initState() {
//     super.initState();

    
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 900),
//     );
   
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
  

//   void _toggleSearch() {
//     setState(() {
//       _isSearching = !_isSearching;
//       if (_isSearching) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//         checkWeather();
//       }
//     });
//   }
// void checkWeather(){
//   print("Ehtesham");
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
        
//         title: _isSearching
//             ? Container(
//               height: 40,
//               child: SizeTransition(
//                   sizeFactor: _animationController,
//                   axis: Axis.horizontal,
//                   child: TextField(
                    
//                     controller: cityName,
//                     style: const TextStyle(color: Colors.white),
//                     textCapitalization: TextCapitalization.words,
//                     decoration: const InputDecoration(
//                       labelText: "Enter City Name",
//                       labelStyle: TextStyle(color: Colors.white),
//                       filled: true,
//                       fillColor: Colors.black38,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         borderSide: BorderSide(width: 3, 
//                         color: Colors.white,
                        
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                         borderSide: BorderSide(width: 3,
                       
//                          color: Colors.green),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(width: 3,
//                          color: Color.fromARGB(255, 66, 125, 145),
                         
//                          ),
//                       ),
//                     ),
//                   ),
//                 ),
//             )
//             : null,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.search, size: 30),
//           onPressed: () {
//             _toggleSearch();
//           },
//         ),
//         actions: [
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             child: GestureDetector(
//               onTap: () {},
//               child: Icon(Icons.menu, size: 30),
//             ),
//           ),
//         ],
//       ),
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         child: Stack(
//           children: [
//             Image.asset(
//               'assets/images/night.jpg',
//               fit: BoxFit.cover,
//               height: double.infinity,
//               width: double.infinity,
//             ),
//             Container(
//               decoration: BoxDecoration(color: Colors.black38),
//             ),
//            Container(
//                 margin: EdgeInsets.only(top: 110),
//                 child: Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       width: 12,
//                       height: 5,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       width: 5,
//                       height: 5,
//                       decoration: BoxDecoration(
//                           color: Colors.white24,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       width: 5,
//                       height: 5,
//                       decoration: BoxDecoration(
//                           color: Colors.white24,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       width: 5,
//                       height: 5,
//                       decoration: BoxDecoration(
//                           color: Colors.white24,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                     )
//                   ],
//                 ),
//               ),
//               PageView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: locationList.length,
//                 itemBuilder: (context, index) => SingleWeather(),

//               ),
//             ],
//           ),
//         ));
//   }
// }



import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  final Map<String, dynamic> data;

  WeatherPage({required this.data});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Map<String, dynamic>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = fetchWeatherData();
  }

  Future<Map<String, dynamic>> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${widget.data['coord']['lat']}&lon=${widget.data['coord']['lon']}&appid=1630aa112b284dcbb59ca0e3eaab31dd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  String _getBackgroundImage(Map<String, dynamic> weatherData) {
    final weatherMain =
        weatherData['weather'][0]['main'].toString().toLowerCase();

    switch (weatherMain) {
      // ... (your switch cases)
      default:
        return 'assets/images/night.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.data['name'],
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w900, fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nightf.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<Map<String, dynamic>>(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data'));
            } else {
              final weatherList = snapshot.data!['list'];

              return ListView.builder(
                itemCount: weatherList.length,
                itemBuilder: (context, index) {
                  final weatherItem = weatherList[index];
                  final temp = weatherItem['main']['temp'];
                  final description = weatherItem['weather'][0]['description'];
                  final backgroundImage = _getBackgroundImage(weatherItem);

                  return GestureDetector(
                    onTap: () {
                      print("hello");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(backgroundImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_getTemperatureCelsius(temp)}°C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  'Time: ${weatherItem['dt_txt']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Description: $description',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  String _getTemperatureCelsius(temperatureKelvin) {
    return (temperatureKelvin - 273.15).toStringAsFixed(1);
  }
}

