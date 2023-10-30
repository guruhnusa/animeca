
import 'package:animeca/app/data/models/info_anime.dart';
import 'package:animeca/app/data/sevices/api_anime.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  var animeInfoList = <AnimeInfo>[].obs;

  Future <List<AnimeInfo>> fetchAnimeInfo(String id) async {
    try {
      var data = await apiAnime.getDataAnime(id);
      if (data != null) {
        animeInfoList.add(data);
        print(animeInfoList.value[0].description);
        return animeInfoList;
      } else {
        throw Exception('Data anime favorit tidak ditemukan');
      }
    } catch (e) {
      print(e);
      return [] ;
    }
  }
}
