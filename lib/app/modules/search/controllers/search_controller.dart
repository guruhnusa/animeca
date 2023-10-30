import 'package:animeca/app/data/models/search_anime.dart';
import 'package:animeca/app/data/sevices/api_anime.dart';
import 'package:get/get.dart';

class SearchAnimeController extends GetxController {

  var searchAnimeList = <SearchAnime>[].obs;
  RxString key = "".obs;


  Future<List<SearchAnime>> searchAnime(String keyword) async {
    try {
      var data = await apiAnime.getSearchAnime(keyword);
      if (data != null) {
        searchAnimeList.assignAll(data.map((item) => SearchAnime.fromJson(item)).toList());
        return searchAnimeList;
      } else {
        throw Exception('Data anime favorit tidak ditemukan');
      }
    } catch(e){
      print("error");
      return [];
    }
  }

}
