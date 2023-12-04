import 'package:booking/app/modules/tabbarview/views/motion-tab-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarviewController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement TabbarviewController
  MotionTabBarController? motionTabBarController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    motionTabBarController!.dispose();
  }

  void increment() => count.value++;
}
