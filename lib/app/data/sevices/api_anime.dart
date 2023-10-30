import 'dart:convert';

import 'package:animeca/app/data/constraint/api_url.dart';
import 'package:animeca/app/data/models/info_anime.dart';
import 'package:animeca/app/data/models/watch_anime.dart';
import 'package:http/http.dart' as http;


class apiAnime{
  static var client = http.Client();

  static Future<List?> fetchDataFav()async{
    String url = BASE_URL;
    var response = await client.get(Uri.parse(url+"top-airing"));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body)["results"];
      return data;
    } else {
      print("error api");
    }
  }

  static Future<List?> fetchRecent()async{
    String url = BASE_URL;
    var response = await client.get(Uri.parse(url+"recent-episodes"));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body)["results"];
      return data;
    } else {
      print("error api");
    }
  }

  static Future<AnimeInfo?> getDataAnime(String id) async {
    String url = BASE_URL;

    var response = await client.get(Uri.parse(url + "info/$id"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return AnimeInfo.fromJson(data);
    } else {
      print("error api");
      return null;
    }
  }

  static Future<List?> watchAnime(String id) async {
    String url = BASE_URL;

    var response = await client.get(Uri.parse(url + "watch/$id"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["sources"];
      return data;
    } else {
      print("error api");
      return null;
    }
  }

  static Future<List?> getSearchAnime(String keyword)async{
    String url = BASE_URL;
    var response = await client.get(Uri.parse(url+"${keyword}"));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body)["results"];
      print(data);
      return data;
    } else {
      print("error api");
    }
  }


}