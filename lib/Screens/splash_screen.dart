import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quran_soul/Screens/main_screen.dart';
import 'package:quran_soul/Screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyUsed = false;

  void getData() async {
    //obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {

    super.initState();
    getData();
    // Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
    // MaterialPageRoute(builder: (context){
    //   return  alreadyUsed ? MainScreen() : OnBoardingScreen();
    // })
    // ));
    Timer(Duration(seconds: 3),(){
      Get.offNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Text(
                'Quran Soul',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('assets/islamic.png'),
            )
          ],
        ),
      ),
    );
  }
}
