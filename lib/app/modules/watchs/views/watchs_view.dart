import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/data/models/info_anime.dart';
import 'package:animeca/app/data/models/watch_anime.dart';
import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/watchs_controller.dart';

class WatchsView extends GetView<WatchsController> {
  final arguments = Get.arguments;

   WatchsView({super.key});

  @override
  Widget build(BuildContext context) {
    var idAnime = arguments[0];
    RxString idStream = "${arguments[1]}".obs;
    RxString nowEpisode = "1".obs;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                controller.dispose();
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: 12),
          Obx(() {
            return Center(
                child: Text(
              "Now playing Episode ${nowEpisode}",
              style: textRegular.copyWith(fontSize: 12, color: Colors.white),
            ));
          }),
          SizedBox(height: 7,),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Obx(() {
              return FutureBuilder<List<WatchAnime>>(
                future: controller.watchAnime(idStream.value),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    final anime = data?[2];
                    var link = anime?.url;
                    print(link);
                    return Chewie(
                      controller: controller.setStreamAnime(link!),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder<List<AnimeInfo>>(
              future: controller.fetchAnimeInfo(idAnime),
              builder: (context, snapshot) {
                final data = snapshot.data;
                final anime = data?[0];
                if (snapshot.hasData) {
                  return Container(
                    height:  460,
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${anime?.title} ",
                            style: textSemibold.copyWith(
                                fontSize: 18, color: color2)),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          "Episodes",
                          style: textSemibold.copyWith(
                              fontSize: 18, color: color2),
                        ),
                        Divider(thickness: 1, color: Color(0xFF635985)),
                        Expanded(
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: anime?.episodes.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 22.0,
                              crossAxisSpacing: 22.0,
                              childAspectRatio: 71 / 33,
                            ),
                            itemBuilder: (context, index) {
                              final episode = anime?.episodes[index];
                              return GestureDetector(
                                onTap: () {
                                  final id = episode?.id;
                                  final eps = episode?.number;
                                  nowEpisode.value = "${eps}";
                                  idStream.value = id!;
                                  print("INI LINK : ${idStream.value}");
                                },
                                child: Container(
                                  width: 71,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: color1,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${episode?.number}",
                                      style: textMedium.copyWith(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
