import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moon_calendar/home_page.dart';
import 'package:moon_calendar/service/moon.dart';
import 'package:moon_calendar/service/weather.dart';
import 'package:provider/provider.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userId = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Indigenous Lunar Calendar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(hintText: "User Id"),
              controller: userId,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Provider.of<WeatherService>(context, listen: false)
                    .weatherService();
                Provider.of<MoonPhaseService>(context, listen: false)
                    .moonService();

                Timer(
                  Duration(seconds: 2),
                  () {
                    login(
                      context,
                      userId: userId,
                      password: password,
                    );
                  },
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  login(
    BuildContext context, {
    required TextEditingController userId,
    required TextEditingController password,
  }) {
    String id1 = "harsha123";
    String password1 = "harsha1234";
    String id2 = "hinduja123";
    String password2 = "hinduja1234";
    String id3 = "erin123";
    String password3 = "erin1234";
    if (userId.text == id1 && password.text == password1 ||
        userId.text == id2 && password.text == password2 ||
        userId.text == id3 && password.text == password3) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false,
      );
    }
  }

// ! Future Update - dynamically change lat ang long.
  // Future<Position> _determinePosition({
  //   required BuildContext context,
  //   required TextEditingController userId,
  //   required TextEditingController password,
  // }) async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     } else {
  //       Position _po = await Geolocator.getCurrentPosition();
  //       print(_po);
  //       Provider.of<MoonPhaseService>(context, listen: false)
  //           .moonService()
  //           .then(
  //             (value) => login(
  //               context,
  //               userId: userId,
  //               password: password,
  //             ),
  //           );
  //     }
  //   } else {
  //     Position _po = await Geolocator.getCurrentPosition();
  //     print(_po);
  //     Provider.of<MoonPhaseService>(context, listen: false)
  //         .moonService()
  //         .then(
  //           (value) => login(
  //             context,
  //             userId: userId,
  //             password: password,
  //           ),
  //         );
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }
}