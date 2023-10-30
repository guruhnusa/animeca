import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/data/models/recent_anime.dart';
import 'package:animeca/app/data/models/top_anime.dart';
import 'package:animeca/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../../data/widgets/buttom_home.dart';
import '../../../data/widgets/button_play.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  RxString idPlay = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: textSemibold.copyWith(
                            fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Nusa",
                        style:
                            textSemibold.copyWith(fontSize: 20, color: color2),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            FutureBuilder(
              future: controller.fetchAnimeFav(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Return a loading indicator if the future is still loading.
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data available');
                }
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index, realIndex) {
                        final animeSlider = snapshot.data?[index];
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage("${animeSlider?.image}"),
                                  fit: BoxFit.cover),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: backgroundColor, width: 0)),
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          final data = snapshot.data?[index];
                          idPlay.value = "${data?.id}";
                        },
                        autoPlay: true,
                        height: 390,
                        enlargeCenterPage: true,
                      ),
                    ),
                    ButtonPlay(playFunction: () {
                      Get.toNamed(Routes.DETAILS,arguments: idPlay.value);
                    },),
                    buttonHome(
                        image: "assets/icons/saved.png",
                        text: "My List",
                        bottom: 10,
                        left: 0,
                        right: 200),
                    buttonHome(
                        image: "assets/icons/info.png",
                        text: "Info",
                        bottom: 10,
                        left: 200,
                        right: 0),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Favorite Anime.",
                style: textSemibold.copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FutureBuilder<List<TopAnime>>(
                future: controller.fetchAnimeFav(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    final animeFavlist = snapshot.data;
                    if (animeFavlist != null) {
                      return SizedBox(
                        height: 171,
                        width: 103,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: animeFavlist.length,
                          itemBuilder: (context, index) {
                            final anime = animeFavlist[index];
                            return Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print(anime.id);
                                          Get.toNamed(Routes.DETAILS,
                                              arguments: anime.id);
                                        },
                                        child: Container(
                                          height: 147,
                                          width: 103,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  anime.image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            anime.title,
                                            style: textRegular.copyWith(
                                                fontSize: 12,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            );
                          },
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Recent Episode Anime.",
                style: textSemibold.copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FutureBuilder<List<RecentAnime>>(
                future: controller.fetchRecentAnime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    ); // Tampilkan loading indicator selama data dimuat
                  } else if (snapshot.hasData) {
                    final animeFavlist = snapshot.data;
                    if (animeFavlist != null) {
                      return SizedBox(
                        height: 171,
                        width: 103,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: animeFavlist.length,
                          itemBuilder: (context, index) {
                            final anime = animeFavlist[index];
                            return Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print(anime.id);
                                          Get.toNamed(Routes.DETAILS,
                                              arguments: anime.id);
                                        },
                                        child: Container(
                                          height: 147,
                                          width: 103,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  anime.image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            anime.title,
                                            style: textRegular.copyWith(
                                                fontSize: 12,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            );
                          },
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
            ),
          ],
        ));
  }
}



