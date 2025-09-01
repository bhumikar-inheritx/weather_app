import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _clear = TextEditingController();
  final TextEditingController _controller = TextEditingController();

  final Map<String, Map<String, String>> _allWeather = {
    "Ahmedabad": {
      "Temperature": "35°",
      "Humidity": "10°",
      "Weather description": "clouds",
    },
    "Rajkot": {
      "Temperature": "40°",
      "Humidity": "8°",
      "Weather description": "wind",
    },
    "Mumbai": {
      "Temperature": "30°",
      "Humidity": "35°",
      "Weather description": "cloudy",
    },

    "Baroda": {
      "Temperature": "45°",
      "Humidity": "6°",
      "Weather description": "Sunny",
    },
    "Surat": {
      "Temperature": "10°",
      "Humidity": "2°",
      "Weather description": "rainy",
    },
  };

  Map<String, String>? result;

  void _searchCity() {
    String city = _controller.text.trim();
    setState(() {
      result = _allWeather[city];
    });
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
                    onPressed: () {
                      _clear.clear();
                    },
                    icon: Icon(Icons.close),
                  ),

                  hintStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  filled: true,
                ),
                onSubmitted: (_) => _searchCity(),
              ),
            ),
            SizedBox(height: 30),
            if (result != null)
              Padding(
                padding: const EdgeInsets.only(top: 300, right: 20, left: 20),
                child: Container(
                  height: 200,
                  width: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: result!.entries.map((e) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                e.key,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 30),
                              Text(
                                e.value,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 600, right: 30, left: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
  final String city;

  WeatherDataModel({
    required this.city,
    required this.temp,
    required this.humidity,
    required this.desc,
  });
}

final List<WeatherDataModel> weatherMockData = [
  WeatherDataModel(city: 'City 1', temp: 2, humidity: 3, desc: ''),
  WeatherDataModel(city: 'City 1', temp: 2, humidity: 3, desc: ''),
  WeatherDataModel(city: 'City 1', temp: 2, humidity: 3, desc: ''),
];

class CommonWeatherCard extends StatelessWidget {
  const CommonWeatherCard({super.key, required this.weather});

  final WeatherDataModel weather;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
