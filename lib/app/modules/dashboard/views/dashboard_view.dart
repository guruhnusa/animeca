import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(

            currentIndex: controller.indexBottomNavbar.value,
            onTap: (value) {
              controller.changeIndex(value);
              print(value);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor,
            items: controller.listBottomNavbar
        );
      }),
      body: Obx(() => controller.bodyMain[controller.indexBottomNavbar.value]),
    );
  }
}
