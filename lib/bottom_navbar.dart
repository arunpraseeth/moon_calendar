import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moon_calendar/home_page.dart';
import 'package:moon_calendar/translated.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => Custom_BottomNavBarState();
}

class Custom_BottomNavBarState extends State<CustomBottomNavBar> {
  int index = 0;
  List _pages = [
    HomePage(),
    TranslatePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 55,
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  if (index != 0) {
                    HapticFeedback.lightImpact();
                  }
                  setState(() {
                    index = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: index == 0 ? Colors.black : Colors.grey,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: index == 0 ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (index != 1) {
                    HapticFeedback.lightImpact();
                  }
                  setState(() {
                    index = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.g_translate,
                      color: index == 1 ? Colors.black : Colors.grey,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Translate",
                      style: TextStyle(
                        color: index == 1 ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
