import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_soul/Constants/constants.dart';
import 'package:quran_soul/Screens/quiz_screen.dart';
import 'package:quran_soul/Screens/audio_screen.dart';
import 'package:quran_soul/Screens/home_screen.dart';
import 'package:quran_soul/Screens/profile_screen.dart';
import 'package:quran_soul/Screens/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex = 0;
  List<Widget> _widgetList = [
    HomeScreen(),
    QuranScreen(),
    AudioScreen(),
    QuizScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: _widgetList[selectindex],
            bottomNavigationBar: ConvexAppBar(
              items: [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.menu_book, title: 'Quran'),
                TabItem(icon: Icons.audiotrack, title: 'Audio'),
                TabItem(icon: Icons.quiz, title: 'Quiz'),
                TabItem(icon: Icons.person, title: 'Profile'),
              ],
              initialActiveIndex: 0,
              //optional, default as 0
              onTap: updateIndex,
              backgroundColor: Constants.kPrimary,
              activeColor: Constants.kPrimary,
            )));
  }

  void updateIndex(index) {
    setState(() {
      selectindex = index;
    });
  }
}
