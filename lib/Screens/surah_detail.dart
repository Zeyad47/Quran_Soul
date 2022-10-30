import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quran_soul/services/api_services.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../Constants/constants.dart';
import '../models/translation.dart';
import '../widgets/custom_translation.dart';

enum Translation { Malay, English }

class Surahdetail extends StatefulWidget {
  const Surahdetail({Key? key}) : super(key: key);

  static const String id = 'surahDetail_screen';

  @override
  _SurahdetailState createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  ApiServices _apiServices = ApiServices();

  //SolidController _controller = SolidController();
  Translation? _translation = Translation.Malay;

  //@override
  /*Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _apiServices.getTranslation(Constants.surahIndex!),
        builder: (BuildContext context,
            AsyncSnapshot<SurahTranslationList> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.translationList.length,
              itemBuilder: (context, index) {
                return TranslationTile(
                    index: index,
                    surahTranslation: snapshot.data!.translationList[index]);
              },
            );
          } else
            return Center(
              child: Text('Translation Not Found'),
            );
        },
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    print(_translation!.index);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _apiServices.getTranslation(
              Constants.surahIndex!, _translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                    itemCount: snapshot.data!.translationList.length,
                    itemBuilder: (context, index) {
                      return TranslationTile(
                        index: index,
                        surahTranslation: snapshot.data!.translationList[index],
                      );
                    }),
              );
            } else
              return Center(
                child: Text('Translation Not Found'),
              );
          },
        ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text(
                "^ Select Translation ^",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Malay'),
                      leading: Radio<Translation>(
                          value: Translation.Malay,
                          groupValue: _translation,
                          onChanged: (Translation? value) {
                            setState(() {
                              _translation = value;
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<Translation>(
                          value: Translation.English,
                          groupValue: _translation,
                          onChanged: (Translation? value) {
                            setState(() {
                              _translation = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
