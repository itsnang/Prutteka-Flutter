import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 170,
                  ))),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "From Prutteka.com",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ))
        ],
      ),
    );
  }
}