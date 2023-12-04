import 'package:get/get.dart';

import '../controllers/todoapp_controller.dart';

class TodoappBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoappController>(
      () => TodoappController(),
    );
  }
}
