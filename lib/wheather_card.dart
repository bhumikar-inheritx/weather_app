import 'package:flutter/material.dart';
import 'home_page.dart';

class CommonWeatherCard extends StatelessWidget {
  const CommonWeatherCard({super.key, required this.weather});

  final WeatherDataModel weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.city,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: 'Temperature',),
                        TextWidget(text: 'Humidity'),
                        TextWidget(text: 'Description'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextWidget(text: weather.temp.toString()),
                        TextWidget(text: weather.humidity.toString()),
                        TextWidget(text: weather.desc.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextWidget({ Key? key,required this.text, this.style});

@override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

















