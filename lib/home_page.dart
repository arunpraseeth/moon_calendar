import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 200),
            child: Center(child: Image.asset("assets/logo.png", height: 100)),
          ),
          const SizedBox(height: 180),
          Center(child: Image.asset("assets/turtle.png", height: 250)),
        ],
      ),
    );
  }
}
