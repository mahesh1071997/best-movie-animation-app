import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../superheroes/superhero.dart';
import 'custome_scroll.dart';

class MarvelcardView extends GetView {
   MarvelcardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarvelcardView'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_outlined),
            color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MARVEL',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.brown,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Super Hero',
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          // _buildCarousel(context, 8)
          Expanded(child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              final superHeroe = Superhero.marvelHeroes[index];
              return GestureDetector(
                onVerticalDragUpdate: (val){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  CustomScroll(superHeroe)));
                },
                child: Stack(fit: StackFit.passthrough,
                  children: [
                     Card(
                      elevation: 0,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.only(top: 60),
                      color: Color(superHeroe.rawColor),
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 20, top: 200, right: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  superHeroe.name,
                                  style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(height: 8,),
                               Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  superHeroe.heroName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                     ),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textAlign:TextAlign.justify,
                                  superHeroe.description,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                     ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child:  Image.asset(superHeroe.pathImage,height: 250,width: 500,),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: Superhero.marvelHeroes.length,
            viewportFraction: 0.8,
            scale: 0.9,
          )),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
  List<Color> cardColors = [
    Colors.red[400]!,
    Colors.teal[400]!,
    Colors.cyanAccent[400]!,
    Colors.lime[400]!,
    Colors.pinkAccent[400]!,
    Colors.indigo[400]!,
    // Add more colors for other indices as needed
  ];
  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // Set the desired height for the entire carousel
          height: 450.0,
          child: Container(
            height: 400.0, // Set the height for the PageView
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildCarouselItem(context, carouselIndex, itemIndex);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        color: Colors.blueGrey,
        child: Column(),
      ),
    );
  }
}

