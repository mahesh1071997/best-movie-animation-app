import 'package:get/get.dart';

import '../controllers/watchui_controller.dart';

class WatchuiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchuiController>(
      () => WatchuiController(),
    );
  }
}
