// To parse this JSON data, do
//
//     final watchAnime = watchAnimeFromJson(jsonString);

import 'dart:convert';

List<WatchAnime> watchAnimeFromJson(String str) => List<WatchAnime>.from(json.decode(str).map((x) => WatchAnime.fromJson(x)));

String watchAnimeToJson(List<WatchAnime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchAnime {
  String url;
  bool isM3U8;
  String quality;

  WatchAnime({
    required this.url,
    required this.isM3U8,
    required this.quality,
  });

  factory WatchAnime.fromJson(Map<String, dynamic> json) => WatchAnime(
    url: json["url"],
    isM3U8: json["isM3U8"],
    quality: json["quality"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "isM3U8": isM3U8,
    "quality": quality,
  };



}
