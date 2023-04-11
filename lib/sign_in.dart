import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moon_calendar/bottom_navbar.dart';
import 'package:moon_calendar/constants.dart';
import 'package:moon_calendar/loader.dart';
import 'package:moon_calendar/service/moon.dart';
import 'package:moon_calendar/service/weather.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _loader = false;
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
      body: _loader
          ? LoaderWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      "assets/turtle.png",
                      height: 250,
                    ),
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
                        login(
                          context,
                          userId: userId,
                          password: password,
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
      localPosition(
        context: context,
        userId: userId,
        password: password,
      );
    }
  }

// ! Future Update - dynamically change lat ang long.
  Future<Position> localPosition({
    required BuildContext context,
    required TextEditingController userId,
    required TextEditingController password,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showAlertDialog(context, "Location services");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showAlertDialog(context, "Location ${permission.name}");
        return Future.error('Location permissions are denied');
      } else {
        setState(() {
          _loader = true;
        });
        Position _po = await Geolocator.getCurrentPosition();
        Provider.of<WeatherService>(context, listen: false)
            .weatherService(
          latitude: _po.latitude,
          longitude: _po.longitude,
        )
            .then((value) {
          Provider.of<MoonPhaseService>(context, listen: false)
              .moonService()
              .then(
                (value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomBottomNavBar(),
                  ),
                  (route) => false,
                ),
              );
          setState(() {
            _loader = false;
          });
        });
      }
    } else {
      setState(() {
        _loader = true;
      });
      Position _po = await Geolocator.getCurrentPosition();
      Provider.of<WeatherService>(context, listen: false)
          .weatherService(
        latitude: _po.latitude,
        longitude: _po.longitude,
      )
          .then((value) {
        setState(() {
          _loader = false;
        });
        Provider.of<MoonPhaseService>(context, listen: false)
            .moonService()
            .then(
              (value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomBottomNavBar(),
                ),
                (route) => false,
              ),
            );
      });
    }

    if (permission == LocationPermission.deniedForever) {
      showAlertDialog(context, "Location ${permission.name}");
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future showAlertDialog(BuildContext context, String permissionFor) async {
    if (Platform.isAndroid) {
      Widget cancelButton = TextButton(
        child: const Text(
          "Cancel",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      );
      Widget logoutButton = TextButton(
        child: const Text(
          "Enable",
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
          ),
        ),
        onPressed: () => openAppSettings(),
      );

      AlertDialog alert = AlertDialog(
        content: Text("Enable $permissionFor permission."),
        actions: [
          cancelButton,
          logoutButton,
        ],
      );
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
