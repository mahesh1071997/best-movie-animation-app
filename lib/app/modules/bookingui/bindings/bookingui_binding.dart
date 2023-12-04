import 'package:get/get.dart';

import '../controllers/bookingui_controller.dart';

class BookinguiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookinguiController>(
      () => BookinguiController(),
    );
  }
}
