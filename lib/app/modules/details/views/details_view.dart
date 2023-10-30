import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/data/models/info_anime.dart';
import 'package:animeca/app/data/widgets/row_icons.dart';
import 'package:animeca/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:animeca/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {

  final favoriteCon = Get.put(FavoriteController(), permanent: true);

  final data = Get.arguments;

  DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<AnimeInfo>>(
        future: controller.fetchAnimeInfo(data),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            final anime = data?[0];
            if (anime != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.delete<DetailsController>();
                            Get.toNamed(Routes.DASHBOARD);
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(anime.image),
                              fit: BoxFit.cover),
                          border:
                          Border.all(color: backgroundColor, width: 0)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      anime.title,
                      style:
                      textSemibold.copyWith(fontSize: 20, color: color2),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "${anime.releaseDate}  ",
                          style: textRegular.copyWith(
                              fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          "|  ${anime.totalEpisodes} Episodes",
                          style: textRegular.copyWith(
                              fontSize: 14, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        height: 95,
                        width: double.infinity,
                        child: Text(
                          anime.description,
                          style: textRegular.copyWith(
                              fontSize: 12, color: Colors.white),
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        )),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowIcons(text: "Like", icons: "like.png"),
                        const SizedBox(
                          width: 35,
                        ),
                        RowIcons(text: "Share", icons: "share.png"),
                        const SizedBox(width: 29,),
                        SizedBox(
                          height: 38,
                          width: 108,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: color4,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                              onPressed: () {
                                favoriteCon.addFavoriteAnime(anime);
                              }, child: const Text("Favorite")),
                        ),
                        const SizedBox(width: 13,),
                        SizedBox(
                          height: 38,
                          width: 108,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                              onPressed: () {
                            final streamid = anime.episodes[0].id;
                            print(anime.id);
                            Get.toNamed(Routes.WATCHS,arguments: [anime.id,streamid]);
                          }, child: const Text("Watch")),
                        ),

                      ],
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              );
            } else {
              return const Text('No data');
            }
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          } else {
            return const Text('Data is null.');
          }
        },
      ),
    );
  }
}
