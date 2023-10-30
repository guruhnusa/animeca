import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60,),
          Center(child: Text("Favorite Anime",
            style: textSemibold.copyWith(fontSize: 20, color: color3),)),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text("Swipe to remove from favorite",
              style: textRegular.copyWith(fontSize: 12, color: Colors.white),),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.favoriteAnime.length,
                itemBuilder: (context, index) {
                  final anime = controller.favoriteAnime[index];
                  return Dismissible(
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20,right: 20),
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: color1,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Icon(Icons.delete_forever_rounded,color: Colors.white,size: 40,),
                          Icon(Icons.delete_forever_rounded,color: Colors.white,size: 40,)
                        ]),
                      ),
                    ),
                    key: Key("${anime.id}"),
                    onDismissed: (direction) {
                      controller.removeFavorite(anime);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text('Success remove ${anime.title} from favorite anime',style: textRegular.copyWith(fontSize: 13),maxLines: 1)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20,right: 20),
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFF1D1F2C),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAILS, arguments: anime.id);
                              },
                              child: Container(
                                height: 112,
                                width: 72,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: NetworkImage(anime.image),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 230,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(anime.title,
                                      style:
                                      textRegular.copyWith(
                                          fontSize: 14, color: color2),
                                      overflow: TextOverflow.ellipsis),
                                  Text(
                                    "${anime.totalEpisodes}  Episodes",
                                    style: textRegular.copyWith(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                  Text(anime.description,
                                      style: textRegular.copyWith(
                                          fontSize: 12, color: Colors.white),
                                      maxLines: 3,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
