// To parse this JSON data, do
//
//     final topAnime = topAnimeFromJson(jsonString);

import 'dart:convert';

List<TopAnime> topAnimeFromJson(String str) => List<TopAnime>.from(json.decode(str).map((x) => TopAnime.fromJson(x)));

String topAnimeToJson(List<TopAnime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopAnime {
  String id;
  String title;
  String image;
  String url;
  List<String> genres;

  TopAnime({
    required this.id,
    required this.title,
    required this.image,
    required this.url,
    required this.genres,
  });

  factory TopAnime.fromJson(Map<String, dynamic> json) => TopAnime(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    url: json["url"],
    genres: List<String>.from(json["genres"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "url": url,
    "genres": List<dynamic>.from(genres.map((x) => x)),
  };
}
