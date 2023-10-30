import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/data/models/search_anime.dart';
import 'package:animeca/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchAnimeController> {
   SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onSubmitted: (value) {
                  controller.key.value = value;
                  print(controller.key.value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_outlined),
                  contentPadding: const EdgeInsets.all(13),
                  hintStyle: textRegular.copyWith(fontSize: 14, color: const Color(0xFF929292)),
                  hintText: "Search Anime",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF929292),width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: color2,width: 2),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              )

            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () {
                    return FutureBuilder<List<SearchAnime>>(
                      future: controller.searchAnime("${controller.key}"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            (snapshot.data)!.isEmpty) {
                          return Center(child: Text('ANIMECA',style: textBold.copyWith(fontSize: 48,color: color3),));
                        } else {
                          final data = snapshot.data;
                          return GridView.builder(
                            itemCount: data?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 103 / 160,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              final searchData = data?[index];
                              return SizedBox(
                                height: 160,
                                width: 103,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print(searchData.id);
                                        Get.toNamed(Routes.DETAILS,
                                            arguments: searchData.id);
                                      },
                                      child: Container(
                                        height: 147,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(searchData!.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      width: 103,
                                      child: Text(
                                        searchData.title,
                                        style: textRegular.copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
