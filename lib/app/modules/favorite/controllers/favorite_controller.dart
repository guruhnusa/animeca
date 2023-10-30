import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/data/models/info_anime.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {

  RxList<AnimeInfo> favoriteAnime =<AnimeInfo>[].obs;

  void snackbar(String title,String message,Color color){
    Get.snackbar(
      duration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      " ",
      " ",
      backgroundColor: color,
      titleText: Center(
        child: Text(
          title,
          style: textBold.copyWith(color: Colors.white),
        ),
      ),
      messageText: Center(
        child: Text(
          message,
          style: textSemibold.copyWith(fontSize: 11, color: Colors.white),
        ),
      ),
    );
  }

  void addFavoriteAnime(AnimeInfo anime) {
    if (favoriteAnime.contains(anime)) {
      snackbar("Already in Favorites", "This anime is already in your favorites.",color1);
    } else {
      favoriteAnime.add(anime);
     snackbar("Success add to favorite", "Check your favorite anime in the favorites page.",const Color(0xFF1D1F2C));
    }
  }


  Future removeFavorite(AnimeInfo anime) async {
    await favoriteAnime.remove(anime);
    update();
  }

}
