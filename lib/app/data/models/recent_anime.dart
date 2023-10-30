// To parse this JSON data, do
//
//     final recentAnime = recentAnimeFromJson(jsonString);

import 'dart:convert';

List<RecentAnime> recentAnimeFromJson(String str) => List<RecentAnime>.from(json.decode(str).map((x) => RecentAnime.fromJson(x)));

String recentAnimeToJson(List<RecentAnime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentAnime {
  String id;
  String episodeId;
  int episodeNumber;
  String title;
  String image;
  String url;

  RecentAnime({
    required this.id,
    required this.episodeId,
    required this.episodeNumber,
    required this.title,
    required this.image,
    required this.url,
  });

  factory RecentAnime.fromJson(Map<String, dynamic> json) => RecentAnime(
    id: json["id"],
    episodeId: json["episodeId"],
    episodeNumber: json["episodeNumber"],
    title: json["title"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "episodeId": episodeId,
    "episodeNumber": episodeNumber,
    "title": title,
    "image": image,
    "url": url,
  };
}
