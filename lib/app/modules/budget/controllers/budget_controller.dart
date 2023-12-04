import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/budget_view.dart';

class BudgetController extends GetxController {
  //TODO: Implement BudgetController

  final count = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  RxBool isFocused = false.obs;
  int selectedIndex = 0; // To track the selected item index
  ScrollController scrollController = ScrollController();

  // Sample list of items with text and icons
  final List<ItemData> items = [
    ItemData("Glossary", "400", Icons.g_mobiledata),
    ItemData("Cafe", "600", Icons.local_cafe),
    ItemData("Gym", "750", Icons.sports_gymnastics),
    ItemData("Food", "800", Icons.fastfood),
    ItemData("Games", "900", Icons.gamepad_rounded),
    ItemData("Cycling", "500", Icons.bike_scooter),
  ];
  int focusedIndex = 0;
  String focusedText = "400";
  dynamic currentWheel = 12;
   AnimatedDigitController controllerAnimated = AnimatedDigitController(400);
  List<String> listOfStrings = ['Cars', 'Glossary', 'Gym', 'Luge'];
  List<IconData> listOfIcons = [
    Icons.car_rental_sharp,
    Icons.insert_invitation,
    Icons.sports_gymnastics,
    Icons.luggage_outlined
  ];
  RxInt currentIndex = 0.obs;

  void _onScroll() {
    final index = (scrollController.offset / 100).round();

    if (index != selectedIndex) {
      selectedIndex = index;
      update(['BudgetController']);
    }

    // Calculate the maximum scroll extent.
    final maxScrollExtent = scrollController.position.maxScrollExtent;

    // If the current scroll position is at the maximum scroll extent,
    // focus the last item.
    if (scrollController.position.pixels == maxScrollExtent) {
      selectedIndex = scrollController.position.maxScrollExtent ~/ 100;
      update(['BudgetController']);
    }
  }

  changeIndex(int index) {
    isFocused.value = index == selectedIndex;
    update(['BudgetController']);
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
  }

  void increment() => count.value++;
}
