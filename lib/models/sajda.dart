import 'package:flutter/material.dart';

class SajdaList {
  final List<SajdaAyah> sajdaAyahs;

  SajdaList({required this.sajdaAyahs});

  factory SajdaList.fromJSON(Map<String, dynamic> json) {
    Iterable allSajdas = json['data']['ayahs'];
    List<SajdaAyah> sajdas =
        allSajdas.map((e) => SajdaAyah.fromJSON(e)).toList();

    return SajdaList(sajdaAyahs: sajdas);
  }
}

class SajdaAyah {
  final int number;
  final int juzNumber;
  final int manzilNumber;
  final int rukuNumber;
  final int sajdaNumber;
  final String text;
  final String surahName;
  final String englishNameTranslation;
  final String surahEnglishName;
  final String revelationType;

  SajdaAyah({
    required this.number,
    required this.juzNumber,
    required this.manzilNumber,
    required this.revelationType,
    required this.rukuNumber,
    required this.sajdaNumber,
    required this.surahEnglishName,
    required this.surahName,
    required this.englishNameTranslation,
    required this.text,
  });

  factory SajdaAyah.fromJSON(Map<String, dynamic> json) {
    return SajdaAyah(
        number: json['number'],
        text: json['text'],
        surahName: json['surah']['name'],
        surahEnglishName: json['surah']['englishName'],
        englishNameTranslation: json['surah']['englishNameTranslation'],
        juzNumber: json['juz'],
        manzilNumber: json['manzil'],
        rukuNumber: json['ruku'],
        revelationType: json['surah']['revelationType'],
        sajdaNumber: json['sajda']['id']);
  }
}
