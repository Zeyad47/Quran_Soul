import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:quran_soul/models/ayah_of_the_day.dart';
import 'package:quran_soul/models/juz.dart';
import 'package:quran_soul/models/sajda.dart';

import '../models/surah.dart';
import '../models/translation.dart';

class ApiServices {
  final endPointUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<AyahOfTheDay> getAyahOfTheDay() async {
    String url =
        "https://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-utmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyahOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed to load Post");
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async {
    Response res = await http.get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print('ol ${list.length}');
      return list;
    } else {
      throw ('Cannot get the Surah');
    }
  }

  Future<SajdaList> getSajda() async {
    String url = "http://api.alquran.cloud/v1/sajda/en.asad";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return SajdaList.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed to Load Post");
    }
  }

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return JuzModel.fromJSOM(json.decode(response.body));
    } else {
      print('Failed to load');
      throw Exception("Failed to Load Post");
    }
  }

  Future<SurahTranslationList> getTranslation(
      int index, int translationIndex) async {
    String lan = "";
    if (translationIndex == 0) {
      lan = "indonesian_sabiq";
    } else if (translationIndex == 1) {
      lan = "english_saheeh";
    }

    final url = "https://quranenc.com/api/translation/sura/$lan/$index";
    var res = await http.get(Uri.parse(url));

    return SurahTranslationList.fromJSON(json.decode(res.body));
  }
}
