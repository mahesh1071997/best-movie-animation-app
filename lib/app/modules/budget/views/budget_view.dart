import 'package:animated_digit/animated_digit.dart';
import 'package:booking/app/modules/budget/views/ruller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../controllers/budget_controller.dart';
import 'demoo.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BudgetController(),
        id: 'BudgetController',
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: const [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(Icons.search, color: Colors.white),
                SizedBox(
                  width: 25,
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 0,
              leading: const Icon(Icons.arrow_back, color: Colors.black),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Setup a monthly\nbudget goal",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Total Budget is ',
                              children: [
                                TextSpan(
                                  text: '\$1500',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: ScrollSnapList(
                        onItemFocus: (index) {
                          controller.focusedIndex = index;
                          controller.update(['BudgetController']);
                        },
                        endOfListTolerance: 150,
                        padding: const EdgeInsets.all(0),
                        itemSize: 60,
                        margin: const EdgeInsets.all(0),
                        itemBuilder: (_, index) {

                          if (controller.focusedIndex == index) {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              controller.controllerAnimated.resetValue(int.parse(controller.items[index].description));
                            });
                            return Container(
                              width: 250,
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Flex(
                                direction: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Card(
                                      color: Colors.indigo,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(
                                          controller.items[index].icon,
                                          size: 33,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.items[index].text,
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "\$${controller.items[index].description}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return SizedBox(
                              width: 90,
                              height: 20,
                              child: Card(
                                color: Colors.indigo,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    controller.items[index].icon,
                                    size: 33,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        itemCount: controller.items.length,
                        focusToItem: (index) {
                          controller.focusedIndex = index;
                          controller.focusedText =
                              controller.items[index].description;
                          controller.controllerAnimated.resetValue(
                              int.parse(controller.items[index].description));
                          controller.update(['BudgetController']);
                        },

                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        dynamicItemSize: true,
                        onReachEnd: () {
                          controller.update(['BudgetController']);
                        },
                        listViewPadding: const EdgeInsets.all(12),
                        // dynamicSizeEquation: customEquation, //optional
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "\$ ",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          AnimatedDigitWidget(
                            controller: controller.controllerAnimated,
                            textStyle: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.save,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(21)),
                        border: Border.all(color: Colors.indigoAccent),
                        color: Colors.indigoAccent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          WheelSlider(
                            totalCount: 200,
                            initValue: 10,lineColor: Colors.white,pointerHeight: 50,itemSize: 10,
                          horizontalListHeight: 39,pointerColor: Colors.blue,pointerWidth: 5,
                            onValueChanged: (val) {
                              controller.currentWheel = val;
                              controller.controllerAnimated.resetValue(controller.currentWheel*120);
                              controller.update(['BudgetController']);
                            },
                            hapticFeedbackType: HapticFeedbackType.vibrate,
                          ),
                         /* Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: RulerWidget(
                                  height: 60,
                                  scaleBackgroundColor: Colors.indigoAccent,
                                  largeScaleBarsInterval: 24,
                                  smallScaleBarsInterval: 3,
                                  barsColor: Colors.white,
                                ),
                              ),
                              const Positioned(
                                left: 30,
                                child: Card(
                                  child: SizedBox(
                                    height: 40,
                                    width: 8,
                                    child: ColoredBox(color: Colors.blue),
                                  ),
                                ),
                              )
                            ],
                          ),*/
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Flex(
                              direction: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 19),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Normal",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Sometime You can eat in cafe up to 3% off economy",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(21.0),
                                      child: Text(
                                        "Save",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget box(
      {required String title,
      required WheelSlider wheelSlider,
      Text? valueText}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Get.theme.textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          wheelSlider,
          valueText ?? Container(),
        ],
      ),
    );
  }
}

class ItemData {
  final String text;
  final String description;
  final IconData icon;

  ItemData(this.text, this.description, this.icon);
}

class FocusedItemContainer extends StatelessWidget {
  final ItemData item;

  FocusedItemContainer(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.blue),
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Card(
              color: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  item.icon,
                  size: 33,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item.text,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$608',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UnfocusedItemContainer extends StatelessWidget {
  final IconData icon;

  UnfocusedItemContainer(this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          icon,
          size: 33,
          color: Colors.white,
        ),
      ),
    );
  }
}
