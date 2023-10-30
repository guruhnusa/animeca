import 'package:get/get.dart';

import '../controllers/watchs_controller.dart';

class WatchsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchsController>(
      () => WatchsController(),
    );
  }
}
