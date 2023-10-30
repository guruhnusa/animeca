// To parse this JSON data, do
//
//     final searchAnime = searchAnimeFromJson(jsonString);

import 'dart:convert';

List<SearchAnime> searchAnimeFromJson(String str) => List<SearchAnime>.from(json.decode(str).map((x) => SearchAnime.fromJson(x)));

String searchAnimeToJson(List<SearchAnime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchAnime {
  String id;
  String title;
  String url;
  String image;
  String releaseDate;
  SubOrDub subOrDub;

  SearchAnime({
    required this.id,
    required this.title,
    required this.url,
    required this.image,
    required this.releaseDate,
    required this.subOrDub,
  });

  factory SearchAnime.fromJson(Map<String, dynamic> json) => SearchAnime(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    image: json["image"],
    releaseDate: json["releaseDate"],
    subOrDub: subOrDubValues.map[json["subOrDub"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "image": image,
    "releaseDate": releaseDate,
    "subOrDub": subOrDubValues.reverse[subOrDub],
  };
}

enum SubOrDub {
  DUB,
  SUB
}

final subOrDubValues = EnumValues({
  "dub": SubOrDub.DUB,
  "sub": SubOrDub.SUB
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
