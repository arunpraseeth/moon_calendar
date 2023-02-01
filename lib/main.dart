import 'package:flutter/material.dart';
import 'package:moon_calendar/service/moon.dart';
import 'package:moon_calendar/service/weather.dart';
import 'package:moon_calendar/sign_in.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoonPhaseService()),
        ChangeNotifierProvider(create: (context) => WeatherService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moon calendar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Signin(),
      ),
    );
  }
}
