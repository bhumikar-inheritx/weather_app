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
    "Ahemedabad": {
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/weather.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: TextField(
              controller: _controller ,
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
              onSubmitted: (_) => _searchCity() ,
            ),
          ),
         SizedBox(height: 30,),
          if (result != null)
            Padding(
              padding: const EdgeInsets.only(top: 300,right: 20,left: 20),
              child: Container(
                height: 200,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                    child: Column(

                      children: result!.entries.map((e) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(e.key,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(width: 30,),
                            Text(e.value,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            // Column(
                            //   spacing: 20,
                            //   children: [
                            //
                            //   ],
                            // ),
                            // SizedBox(width: 50,),
                            // Column(
                            //   children: [
                            //     Row(
                            //       spacing: 20,
                            //       children: [
                            //
                            //       ],
                            //     ),
                            //   ],
                            // )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 600,right: 30,left: 150),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),

              ),
            ),
        ],
      ),
    );
  }
}
