import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/Huorly_cart.dart';
import '../api/WeatherDetails.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Size screensize;

  String cityName = "Loading...";
  String temperature = "0";
  String temperatureF = "0";
  String weatherCondition = "Loading...";
  String windSpeed = "0";

  final List<String> weekDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    try {
      final weatherData =
          await WeatherDetails.getWeatherDetails('bandar abbas');
      setState(() {
        cityName = weatherData['location']['name'];
        temperature = weatherData['current']['temp_c'].toString() + " °C";
        temperatureF = weatherData['current']['temp_f'].toString() + " °F";
        weatherCondition = weatherData['current']['condition']['text'];
        windSpeed = weatherData['current']['wind_kph'].toString() + " kph";
      });
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        cityName = "Error";
        temperature = "--";
        weatherCondition = "Failed to load data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size;
    final todayIndex = DateTime.now().weekday % 7;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: screensize.width,
              height: screensize.height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff9BC6FD), Color(0xff5099FC)])),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cityName,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          weatherCondition,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/sun_icon.jpg',
                        height: 100,
                      ),
                      Column(children: [
                        Text(
                          temperature,
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        Text(
                          weatherCondition,
                          style: TextStyle(color: Colors.white60, fontSize: 24),
                        ),
                      ]),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 30),
                              text: temperatureF,
                              children: [
                            TextSpan(
                                text: '',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 30))
                          ]))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cardWidget(
                        image: 'assets/wind_icon.jpg',
                      ),
                      cardWidget(
                        image: 'assets/drop_icon.jpg',
                      ),
                      cardWidget(
                        image: 'assets/rain_icon.png',
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Huorly',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            Container(
                width: double.infinity,
                height: screensize.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Huorly_Cart(
                      screensize: screensize,
                      index: index,
                      cityName: cityName,
                      temperature: temperature,
                      weatherCondition: weatherCondition,
                    ));
                  },
                )),
            Expanded(
                child: ListView.separated(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final dayIndex = (todayIndex + index + 1) % 7;
                      return ListTile(
                          title: Text(weekDays[dayIndex]),
                          leading: Image.asset("assets/weathers.webp"));
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    }))
          ],
        ),
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    final randomDarsad = Random().nextInt(51);
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              height: 45,
            )),
        Text(
          '$randomDarsad %',
          style: TextStyle(color: Colors.white70, fontSize: 20),
        ),
      ],
    );
  }
}
