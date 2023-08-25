import 'package:flutter/material.dart';
import 'package:testapp/models/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('Kindacode.com'),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'This is an awesome shopping platform',
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Colors.pink,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:testapp/models/weather_locations.dart';
// import 'package:testapp/widgets/single_weather.dart';

// class WeatherApp extends StatefulWidget {
//   const WeatherApp({Key? key}) : super(key: key);

//   @override
//   State<WeatherApp> createState() => _WeatherAppState();
// }

// class _WeatherAppState extends State<WeatherApp> {
//   TextEditingController CityName = TextEditingController();
//   bool _isSearching = false;

//   void _toggleSearch() {
//     setState(() {
//       _isSearching = !_isSearching;
//     });
//   }

//   void _showcontent() {
//     showDialog(
//       context: context, barrierDismissible: false, // user must tap button!

//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.transparent.withOpacity(.5),
//           content: const SingleChildScrollView(
//             child: ListBody(
//               children: [
               
//               ],
//             ),
//           ),
//           actions: [
//             FloatingActionButton(
//               child: const Text('Ok'),
//               onPressed: () {
                
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           title: _isSearching
//             ? TextField(
//                 decoration: InputDecoration(hintText: 'Search...'),
//               )
//             : Text(""),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(Icons.search, size: 30),
//             onPressed: () {
//                _toggleSearch();
//             },
//           ),
//           actions: [
//             Container(
//               margin: EdgeInsets.only(right: 10),
//               child: GestureDetector(
//                 onTap: () {},
//                 child: Icon(Icons.menu, size: 30),
//               ),
//             ),
//           ],
//         ),
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           child: Stack(
//             children: [
//               Image.asset(
//                 'assets/images/night.jpg',
//                 fit: BoxFit.cover,
//                 height: double.infinity,
//                 width: double.infinity,
//               ),
//               Container(
//                 decoration: BoxDecoration(color: Colors.black38),
//               ),
//               Container(
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
//                 itemBuilder: (context, index) => SingleWeather(index),
//               ),
//             ],
//           ),
//         ));
//   }
// }
