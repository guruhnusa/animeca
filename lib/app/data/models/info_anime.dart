// To parse this JSON data, do
//
//     final animeInfo = animeInfoFromJson(jsonString);

import 'dart:convert';

AnimeInfo animeInfoFromJson(String str) => AnimeInfo.fromJson(json.decode(str));

String animeInfoToJson(AnimeInfo data) => json.encode(data.toJson());

class AnimeInfo {
  String id;
  String title;
  String url;
  List<String> genres;
  int totalEpisodes;
  String image;
  String releaseDate;
  String description;
  String subOrDub;
  String type;
  String status;
  String otherName;
  List<Episode> episodes;

  AnimeInfo({
    required this.id,
    required this.title,
    required this.url,
    required this.genres,
    required this.totalEpisodes,
    required this.image,
    required this.releaseDate,
    required this.description,
    required this.subOrDub,
    required this.type,
    required this.status,
    required this.otherName,
    required this.episodes,
  });

  factory AnimeInfo.fromJson(Map<String, dynamic> json) => AnimeInfo(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    totalEpisodes: json["totalEpisodes"],
    image: json["image"],
    releaseDate: json["releaseDate"],
    description: json["description"],
    subOrDub: json["subOrDub"],
    type: json["type"],
    status: json["status"],
    otherName: json["otherName"],
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "totalEpisodes": totalEpisodes,
    "image": image,
    "releaseDate": releaseDate,
    "description": description,
    "subOrDub": subOrDub,
    "type": type,
    "status": status,
    "otherName": otherName,
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
  };
}

class Episode {
  String id;
  int number;
  String url;

  Episode({
    required this.id,
    required this.number,
    required this.url,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    id: json["id"],
    number: json["number"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "url": url,
  };
}
