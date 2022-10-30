import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quran_soul/Constants/constants.dart';
import 'package:quran_soul/Screens/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Read Quran",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customize your reading view, read in multiple languages, Listen different audio",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              image: Center(
                  child: Image.asset(
                'assets/quran.png',
                fit: BoxFit.fitWidth,
              )),
            ),
            PageViewModel(
              title: "Stay Connected",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Choose your reading time, when to be notified and how often",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              image: Center(
                  child: Image.asset(
                'assets/prayer.png',
                fit: BoxFit.fitWidth,
              )),
            ),
            PageViewModel(
              title: "Build Better Habits",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Make Islamic practices a part of your daily life",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              image: Center(
                  child: Image.asset(
                'assets/zakat.png',
                fit: BoxFit.fitWidth,
              )),
            ),
          ],
          onDone: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainScreen())); //change to log-in when ready
          },
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          done: const Text("Done",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Constants.kPrimary,
              color: Colors.grey,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
