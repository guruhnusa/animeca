import 'package:animeca/app/data/models/recent_anime.dart';
import 'package:animeca/app/data/models/top_anime.dart';
import 'package:animeca/app/data/sevices/api_anime.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var animeFavList = <TopAnime>[].obs;


  @override
  void onInit() {
    fetchAnimeFav();
    super.onInit();
  }

  Future<List<TopAnime>> fetchAnimeFav() async {
    try {
      var data = await apiAnime.fetchDataFav();
      if (data != null) {
        animeFavList.assignAll(data.map((item) => TopAnime.fromJson(item)).toList());
        return animeFavList;
      } else {
        throw Exception('Data anime favorit tidak ditemukan');
      }
    } catch(e){
      print("error");
      return [];
    }
  }

  var recentAnimeList = <RecentAnime>[].obs;
  Future<List<RecentAnime>> fetchRecentAnime() async {
    try {
      var data = await apiAnime.fetchRecent();
      if (data != null) {
        recentAnimeList.assignAll(data.map((item) => RecentAnime.fromJson(item)).toList());
        return recentAnimeList;
      } else {
        throw Exception('Data anime favorit tidak ditemukan');
      }
    } catch(e){
      print("error");
      return [];
    }
  }



}
