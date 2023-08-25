import 'package:flutter/material.dart';
import 'package:testapp/models/city.dart'; // Import your City model
import 'package:testapp/models/constants.dart';
import 'package:testapp/ui/home.dart'; // Import your Constants model

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List<City> cities = City.citiesList; // Assuming citiesList is a static list in the City class
  List<City> selectedCities = []; // Initialize an empty list to store selected cities
  Constants myConstants = Constants();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myConstants.primaryColor.withOpacity(.5),
        title: Text(selectedCities.length.toString() + ' selected'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: size.height * .08,
            width: size.width,
            decoration: BoxDecoration(
              border: cities[index].isSelected
                  ? Border.all(
                      color: myConstants.primaryColor.withOpacity(.6),
                      width: 2,
                    )
                  : Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: myConstants.primaryColor.withOpacity(.2),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cities[index].isSelected = !cities[index].isSelected;
                      if (cities[index].isSelected) {
                        selectedCities.add(cities[index]);
                      } else {
                        selectedCities.remove(cities[index]);
                      }
                    });
                  },
                  child: Icon(
                    cities[index].isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 30,
                    color: cities[index].isSelected
                        ? myConstants.primaryColor
                        : Colors.black,
                  ),
                ),
                const SizedBox(width: 10,),
                Text(
                  cities[index].city,
                  style: TextStyle(
                    fontSize: 16,
                    color: cities[index].isSelected
                        ? myConstants.primaryColor
                        : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: myConstants.secondaryColor,
        child: const Icon(Icons.pin_drop),
        onPressed: (){
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
        },
      ),
    );
  }
}
