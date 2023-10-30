import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/modules/favorite/views/favorite_view.dart';
import 'package:animeca/app/modules/home/views/home_view.dart';
import 'package:animeca/app/modules/profile/views/profile_view.dart';
import 'package:animeca/app/modules/search/views/search_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {

  final List<Widget> bodyMain= [
    HomeView(),
    SearchView(),
    FavoriteView(),
    ProfileView()
  ];


  final RxInt indexBottomNavbar = 0.obs;

  void changeIndex(int value) {
    indexBottomNavbar.value = value;
  }

  final List<BottomNavigationBarItem> listBottomNavbar = [
    BottomNavigationBarItem(
        backgroundColor: backgroundColor,
        activeIcon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/icons/home_active.png"))),
        ),
        icon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/icons/home.png"))),
        ),
        label: ""),
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage("assets/icons/search_active.png"))),
        ),
        icon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/search.png"))),
        ),
        label: ""),
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage("assets/icons/favorite_active.png"))),
        ),
        icon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/favorite.png"))),
        ),
        label: ""),
    BottomNavigationBarItem(
        activeIcon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage("assets/icons/user_active.png"))),
        ),
        icon: Container(
          margin: EdgeInsets.only(top: 12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/icons/user.png"))),
        ),
        label: ""),
  ];
}
