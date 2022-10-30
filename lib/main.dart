import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Constants/constants.dart';
import 'Screens/juz_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/main_screen.dart';
import 'Screens/register_screen.dart';
import 'Screens/splash_screen.dart';
import 'Screens/surah_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran Soul',
      theme: ThemeData(
          primarySwatch: Constants.kSwatchColor,
          primaryColor: Constants.kPrimary,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins'),
      home: SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => Surahdetail(),
      },
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
      ],
    );
  }
}
