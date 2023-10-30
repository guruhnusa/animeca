import 'package:animeca/app/data/models/info_anime.dart';
import 'package:animeca/app/data/models/watch_anime.dart';
import 'package:animeca/app/data/sevices/api_anime.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class WatchsController extends GetxController {
  late ChewieController chewieController;

  ChewieController setStreamAnime(String link) {
    return chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse("${link}")),
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
    update();
  }


  var watchAnimeList = <WatchAnime>[].obs;

  Future<List<WatchAnime>> watchAnime(String id) async {
    try {
      var data = await apiAnime.watchAnime(id);
      if (data != null) {
        watchAnimeList
            .assignAll(data.map((item) => WatchAnime.fromJson(item)).toList());
        return watchAnimeList;
      } else {
        throw Exception('Data anime favorit tidak ditemukan');
      }
    } catch (e) {
      print("error");
      return [];
    }
  }

  var animeInfoList = <AnimeInfo>[].obs;

  Future<List<AnimeInfo>> fetchAnimeInfo(String id) async {
    try {
      var data = await apiAnime.getDataAnime(id);
      if (data != null) {
        animeInfoList.add(data);
        return animeInfoList;
      } else {
        throw Exception('Data anime favorit tidak ditemukan');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void onClose() {
    chewieController.pause();
    chewieController.dispose();
    super.onClose();
  }
}
