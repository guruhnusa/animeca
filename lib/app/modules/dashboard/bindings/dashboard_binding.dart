
import 'package:animeca/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:animeca/app/modules/home/controllers/home_controller.dart';
import 'package:animeca/app/modules/profile/controllers/profile_controller.dart';
import 'package:animeca/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<SearchAnimeController>(
          () => SearchAnimeController(),
    );
    Get.lazyPut<FavoriteController>(
          () => FavoriteController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
