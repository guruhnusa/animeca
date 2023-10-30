import 'package:animeca/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );

  }
}
