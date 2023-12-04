import 'package:booking/app/modules/tabbarview/views/finalTabBarFluid.dart';
import 'package:booking/app/modules/tabbarview/views/motion-tab-bar.dart';
import 'package:booking/app/modules/tabbarview/views/motion-tab-controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabbarview_controller.dart';

class TabbarviewView extends GetView<TabbarviewController> {
  const TabbarviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluidNavBarDemo();
  /*  return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: controller.motionTabBarController,
        // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home",
        useSafeArea: true,
        // default: true, apply safe area wrapper
        labels: const ["Dashboard", "Home", "Profile", "Settings"],
        icons: const [
          Icons.dashboard,
          Icons.home,
          Icons.people_alt,
          Icons.settings
        ],
        tabSize: 55,
        tabBarHeight: 45,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.blue[600],
        tabIconSize: 26.0,
        tabIconSelectedSize: 34.0,
        tabSelectedColor: Colors.blueGrey,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.black,
        onTabItemSelected: (int value) {
          controller.motionTabBarController!.index = value;
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        // swipe navigation handling is not supported
        controller: controller.motionTabBarController,
        children: <Widget>[
          MainPageContentComponent(
              title: "Dashboard Page",
              color: Colors.indigo,
              controller: controller.motionTabBarController!),
          MainPageContentComponent(
              title: "Home Page",
              color: Colors.blueAccent,
              controller: controller.motionTabBarController!),
          MainPageContentComponent(
              title: "Profile Page",
              color: Colors.purpleAccent,
              controller: controller.motionTabBarController!),
          MainPageContentComponent(
              title: "Settings Page",
              color: Colors.tealAccent,
              controller: controller.motionTabBarController!),
        ],
      ),
    );*/
  }
}

class MainPageContentComponent extends StatelessWidget {
  const MainPageContentComponent({
    required this.title,
    required this.color,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color color;
  final MotionTabBarController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
