import 'package:get/get.dart';

import '../controllers/marvelcard_controller.dart';

class MarvelcardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarvelcardController>(
      () => MarvelcardController(),
    );
  }
}
