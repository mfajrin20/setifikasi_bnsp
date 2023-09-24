import 'package:flutter/material.dart';
import '../../Model/StyleModel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 89, 84, 229),
              Color.fromARGB(255, 200, 158, 215),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/splashscreen/logo.png",
                    height: 180.0,
                    width: 180.0,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "PORPROV\nDOMPU",
                    textAlign: TextAlign.center,
                    style: kSplash,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}


