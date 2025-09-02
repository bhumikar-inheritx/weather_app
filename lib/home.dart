import 'package:flutter/material.dart';
import 'package:weather_app/wheatherCard.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late TextEditingController _controller = TextEditingController();
  List<WeatherDataModel> result = [];

  @override
  void initState() {
    _controller = TextEditingController();
    result = weatherMockData;
    super.initState();
  }

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  void _searchCity() {
    String query = _controller.text.toLowerCase();
    setState(() {
      result = weatherMockData
          .where((data) => data.city.toLowerCase().contains(query))
          .toList();
    });
  }

  void _clear() {
    _controller.clear();
    result = weatherMockData;
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/weather.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: IconButton(
                    onPressed: _searchCity,
                    icon: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => _clear(),
                    icon: Icon(Icons.close),
                  ),

                  hintStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  filled: true,
                ),
                // onChanged: (_){
                //   _searchCity();
                // },
                onSubmitted: (_) => _searchCity(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final WeatherDataModel weather = result[index];
                        return CommonWeatherCard(weather: weather);
                      },
                      itemCount: result.length,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 775, left: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shadowColor: Colors.black,
                ),
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDataModel {
  final double temp;
  final double humidity;
  final String desc;
  late final String city;

  WeatherDataModel({
    required this.city,
    required this.temp,
    required this.humidity,
    required this.desc,
  });
}

final List<WeatherDataModel> weatherMockData = [
  WeatherDataModel(city: 'Ahmedabad', temp: 38, humidity: 12, desc: 'clouds'),
  WeatherDataModel(city: 'Rajkot', temp: 29, humidity: 3, desc: 'Wind'),
  WeatherDataModel(city: 'Surat', temp: 15, humidity: 9, desc: 'Rainy'),
  WeatherDataModel(city: 'Baroda', temp: 41, humidity: 2, desc: 'Sunny'),
];
