import 'package:get/get.dart';

import '../controllers/tabbarview_controller.dart';

class TabbarviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarviewController>(
      () => TabbarviewController(),
    );
  }
}
