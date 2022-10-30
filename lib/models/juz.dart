class JuzModel {
  final int juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzModel({required this.juzNumber, required this.juzAyahs});

  factory JuzModel.fromJSOM(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']['ayahs'];
    List<JuzAyahs> juzAyahsList =
        juzAyahs.map((e) => JuzAyahs.fromJSON(e)).toList();

    return JuzModel(juzNumber: json['data']['number'], juzAyahs: juzAyahsList);
  }
}

class JuzAyahs {
  final String ayahsText;
  final int ayahNumber;
  final String surahName;

  JuzAyahs(
      {required this.surahName,
      required this.ayahNumber,
      required this.ayahsText});

  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
        ayahNumber: json['number'],
        ayahsText: json['text'],
        surahName: json['surah']['name']);
  }
}
