import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testapp/weather/fivedaysinfo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



const String domain = "https://api.openweathermap.org/data/2.5/weather?";
const String apiKey = "1630aa112b284dcbb59ca0e3eaab31dd";

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp>
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

    getCurrentLocation();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var p = await Geolocator.getCurrentPosition(
      // desiredAccuracy: LocationAccuracy.low,
      forceAndroidLocationManager: true,
    );
    if (p != null) {
      var client = http.Client();
      var uri =
          '${domain}lat=${p.latitude}&lon=${p.longitude}&appid=e232a8e279b0a849124b464f2addbe4d';
      var url = Uri.parse(uri);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var res = response.body;

        setState(() {
          data = json.decode(res);
          cityname =data['name']; 
        });
         var uri1 ='https://api.openweathermap.org/data/2.5/forecast?lat=${p.latitude}&lon=${p.longitude}&appid=1630aa112b284dcbb59ca0e3eaab31dd';
    var url1 = Uri.parse(uri1);
    var response1 = await client.get(url1);
    if (response1.statusCode == 200) {
      var datacheck1 = response1.body;
      timestamp = DateTime.now();
      print(datacheck1);
      var uri2='https://api.ipgeolocation.io/timezone?apiKey=00698ead503d4e9290b60df295a14bbb&lat=${p.latitude}&long=${p.longitude}';
      var url2=Uri.parse(uri2);
      var response2 =await client.get(url2);
       if (response2.statusCode == 200) {
      var datacheck2 = json.decode(response2.body);
      timestamp = DateTime.now();
      setState(() {
      formattedDateTime=datacheck2['date_time_txt'];
      });
      print('dattatatattata:$datacheck2');
      }

    
    
    }
        print("hello");
        print((data));
        print("sss");
      } else {
        print(response.statusCode);
      }
    } else {
      print('Data unavailable');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    cityName.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _animationController.forward();
      } else {
        _animationController.reverse();
        checkWeather();
      }
    });
  }

  void checkWeather() async {
    var client = http.Client();
    var cityNameText = cityName.text;
    var uri = '$domain&q=$cityNameText&appid=$apiKey';
    var url = Uri.parse(uri);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var datacheck = response.body;
      cityName.clear();
      timestamp = DateTime.now();
      print(datacheck);
      setState(() {
        data = json.decode(datacheck);
        lat =data['coord']['lat'];
        lon =data['coord']['lon'];
       
      });
   var uri2='https://api.ipgeolocation.io/timezone?apiKey=00698ead503d4e9290b60df295a14bbb&lat=${lat}&long=${lon}';
      var url2=Uri.parse(uri2);
      var response2 =await client.get(url2);
       if (response2.statusCode == 200) {
      var datacheck2 = json.decode(response2.body);
      timestamp = DateTime.now();
      setState(() {
      formattedDateTime=datacheck2['date_time_txt'];
      });
      print('dattatatattata:$datacheck2');
      }

    var uri1 = 'https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=1630aa112b284dcbb59ca0e3eaab31dd';
    var url1 = Uri.parse(uri1);
    var response1 = await client.get(url1);
    if (response1.statusCode == 200) {
      var datacheck1 = response1.body;
      timestamp = DateTime.now();
      print(datacheck1);
    }

    } else {
      print(response.statusCode);
    }
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
          title: _isSearching
              ? Container(
                  height: 40,
                  child: SizeTransition(
                    sizeFactor: _animationController,
                    axis: Axis.horizontal,
                    child: TextField(
                      controller: cityName,
                      style: const TextStyle(color: Colors.white),
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: "Enter City Name",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black38,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(width: 3, color: Colors.green),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 66, 125, 145),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.search, size: 30),
            onPressed: () {
              _toggleSearch();
            },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.menu, size: 30),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        drawer: Theme(
            data: Theme.of(context).copyWith(
              // Set the transparency here
              canvasColor: Colors
                  .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
            ),
            child: Drawer(
              child: Container(
                color: Colors.transparent.withOpacity(.5),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    // Drawer header
                    DrawerHeader(
                      decoration: BoxDecoration(),
                      child: Text(
                        'Weather ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          
                        ),
                      ),
                    ),
                    // Drawer items
                    ListTile(
                      leading: Icon(Icons.five_mp_sharp),
                      title: Text(
                        'Five Days Forecast',
                        style: TextStyle(color: Colors.white),
                      ),
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeatherPage(data:data)),
            );
                      },
                    ),
                                     ],
                ),
              ),
            )),
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
                              Text(data['name'] ?? "",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              Text(
                                '${formattedDateTime}',
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
