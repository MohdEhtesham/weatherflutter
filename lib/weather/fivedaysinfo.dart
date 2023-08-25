import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/weather/choiceday.dart';

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
      case 'clear':
        return 'assets/images/clear.jpg';
      case 'clouds':
        return 'assets/images/cloud.jpg';
      case 'rain':
        return 'assets/images/rain.jpg';
      case 'haze':
        return 'assets/images/haze.jpg';
      case 'sunny':
        return 'assets/images/sunny.jpg';
      case 'snow':
        return 'assets/images/snow.jpg';
      case 'drizzle':
        return 'assets/images/drizzle.jpg';
      case 'thunderstorm':
        return 'assets/images/thunderstorm.jpg';
      case 'mist':
        return 'assets/images/mist.jpg';
      case 'smoke':
        return 'assets/images/smoke.jpg';
      case 'dust':
        return 'assets/images/dust.jpg';
      case 'fog':
        return 'assets/images/fog.jpg';
      case 'sand':
        return 'assets/images/sand.jpg';
      case 'ash':
        return 'assets/images/ash.jpg';
      case 'squall':
        return 'assets/images/squall.jpg';
      case 'tornado':
        return 'assets/images/tornado.jpg';
      default:
        return 'assets/images/night.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
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
            image: AssetImage('assets/images/black.jpg'),

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

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> ChoiceDay(weatherItem:weatherItem,cityname:widget.data['name'])));
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
                                image: AssetImage(_getBackgroundImage(weatherItem)),
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
