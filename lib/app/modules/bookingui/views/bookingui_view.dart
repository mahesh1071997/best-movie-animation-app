import 'dart:ui';

import 'package:booking/app/modules/bookingui/views/modelHero.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../superheroes/superhero.dart';
import '../controllers/bookingui_controller.dart';

class BookinguiView extends GetView<BookinguiController> {
  const BookinguiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: BookinguiController(),
          id: 'BookingUiUpdated',
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(controller.superHero!.pathImage),fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: Get.height / 1.32,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        controller.superHero = SuperheroName.marvelHeroes[index];
                        return GestureDetector(
                          onVerticalDragUpdate: (val) {},
                          child: Card(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          child: Image.asset(
                                            controller.superHero!.pathImage,fit: BoxFit.fill,
                                            width: 350,
                                            height: 350,
                                          )),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.superHero!.name,
                                      style: GoogleFonts.openSans(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Chip(label: Text("Trending"),backgroundColor: Colors.white54,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey),borderRadius: BorderRadius.all(Radius.circular(12)))),
                                      SizedBox(width: 8,),
                                      Chip(label: Text("Trailer"),backgroundColor: Colors.white54,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey),borderRadius: BorderRadius.all(Radius.circular(12)))),
                                      SizedBox(width: 8,),
                                      Chip(label: Text("Movie"),backgroundColor: Colors.white54,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey),borderRadius: BorderRadius.all(Radius.circular(12)))),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Flex(direction: Axis.horizontal,crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("9.0",),
                                      const SizedBox(width: 4,),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,itemSize: 20,
                                        itemCount: 5,
                                        itemPadding:
                                        const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: Superhero.marvelHeroes.length,
                      viewportFraction: 0.8,
                      onIndexChanged: (val) {
                        controller.superHero = SuperheroName.marvelHeroes[val];
                        controller.update(['BookingUiUpdated']);
                      },
                      scale: 0.9,
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20,),
        child: Container(
          alignment: Alignment.center,
          height: Get.height / 13,
          width: Get.width * 0.62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Colors.blueGrey[800],
          ),
          child: Text(
            'BUY TICKETS',
            style: GoogleFonts.openSans(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
