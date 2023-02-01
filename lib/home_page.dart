import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon_calendar/constants.dart';
import 'package:moon_calendar/service/moon.dart';
import 'package:moon_calendar/service/weather.dart';
import 'package:moon_calendar/weather_serialization.dart';
import 'package:moon_phase/moon_widget.dart';
import 'package:provider/provider.dart';

import 'json_serialization.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late String _moonName;
  late String _moonPhase;
  @override
  Widget build(BuildContext context) {
    int todayDate = DateTime.now().day;
    List<MoonPhaseSerialization> _moondata =
        Provider.of<MoonPhaseService>(context).moonPhaseData;
    _moondata.forEach((element) {
      _moonName = element.moon.last;
      _moonPhase = element.phase;
    });
    WeatherSerialization _weather =
        Provider.of<WeatherService>(context).weatherData;
    double degree = (_weather.currentConditions.temp - 32) * 5 / 9;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wenhnitaronnyon Moon Calendar",
          // "Indigenous Calendar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // Center(
            //   child: Text(
            //     "Wenhnitaronnyon Moon Calendar",
            //     style: TextStyle(
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  SvgPicture.asset("assets/turtle.svg", height: 250),
                  Padding(
                    padding: EdgeInsets.only(left: 108, top: 5),
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: "$todayDate" == "1" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "1"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 84, top: 11),
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: "$todayDate" == "2" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "2"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60, top: 22),
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: "$todayDate" == "3" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "3"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, top: 38),
                    child: Text(
                      "4",
                      style: TextStyle(
                        color: "$todayDate" == "4" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "4"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 60),
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: "$todayDate" == "5" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "5"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 80),
                    child: Text(
                      "6",
                      style: TextStyle(
                        color: "$todayDate" == "6" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "6"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 106),
                    child: Text(
                      "7",
                      style: TextStyle(
                        color: "$todayDate" == "7" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "7"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 130),
                    child: Text(
                      "8",
                      style: TextStyle(
                        color: "$todayDate" == "8" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "8"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 155),
                    child: Text(
                      "9",
                      style: TextStyle(
                        color: "$todayDate" == "9" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "9"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 21, top: 178),
                    child: Text(
                      "10",
                      style: TextStyle(
                        color:
                            "$todayDate" == "10" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "10"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 38, top: 198),
                    child: Text(
                      "11",
                      style: TextStyle(
                        color:
                            "$todayDate" == "11" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "11"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 57, top: 214),
                    child: Text(
                      "12",
                      style: TextStyle(
                        color:
                            "$todayDate" == "12" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "12"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80, top: 224),
                    child: Text(
                      "13",
                      style: TextStyle(
                        color:
                            "$todayDate" == "13" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "13"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 104, top: 230),
                    child: Text(
                      "14",
                      style: TextStyle(
                        color:
                            "$todayDate" == "14" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "14"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130, top: 230),
                    child: Text(
                      "15",
                      style: TextStyle(
                        color:
                            "$todayDate" == "15" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "15"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 153, top: 225),
                    child: Text(
                      "16",
                      style: TextStyle(
                        color:
                            "$todayDate" == "16" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "16"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 177, top: 214),
                    child: Text(
                      "17",
                      style: TextStyle(
                        color:
                            "$todayDate" == "17" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "17"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 197, top: 197),
                    child: Text(
                      "18",
                      style: TextStyle(
                        color:
                            "$todayDate" == "18" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "18"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 213, top: 177),
                    child: Text(
                      "19",
                      style: TextStyle(
                        color:
                            "$todayDate" == "19" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "19"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 224, top: 154),
                    child: Text(
                      "20",
                      style: TextStyle(
                        color:
                            "$todayDate" == "20" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "20"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 230, top: 130),
                    child: Text(
                      "21",
                      style: TextStyle(
                        color:
                            "$todayDate" == "21" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "21"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 230, top: 105),
                    child: Text(
                      "22",
                      style: TextStyle(
                        color:
                            "$todayDate" == "22" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "22"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 224, top: 80),
                    child: Text(
                      "23",
                      style: TextStyle(
                        color:
                            "$todayDate" == "23" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "23"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 212, top: 55),
                    child: Text(
                      "24",
                      style: TextStyle(
                        color:
                            "$todayDate" == "24" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "24"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 196, top: 35),
                    child: Text(
                      "25",
                      style: TextStyle(
                        color:
                            "$todayDate" == "25" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "25"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 176, top: 20),
                    child: Text(
                      "26",
                      style: TextStyle(
                        color:
                            "$todayDate" == "26" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "26"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 154, top: 10),
                    child: Text(
                      "27",
                      style: TextStyle(
                        color:
                            "$todayDate" == "27" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "27"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130, top: 5),
                    child: Text(
                      "28",
                      style: TextStyle(
                        color:
                            "$todayDate" == "28" ? Colors.black : Colors.grey,
                        fontWeight: "$todayDate" == "28"
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: Card(
                  semanticContainer: true,
                  color: secondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Moon Name:",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "  $_moonName",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                semanticContainer: true,
                color: secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Moon Phase:",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "  $_moonPhase",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      MoonWidget(
                        date: DateTime.now(),
                        size: 30,
                        moonColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    semanticContainer: true,
                    color: secondaryColor,
                    child: Container(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Date:",
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "  ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    color: secondaryColor,
                    child: Container(
                      // width: 180,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Temp:",
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "  ${degree.round()} °C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
