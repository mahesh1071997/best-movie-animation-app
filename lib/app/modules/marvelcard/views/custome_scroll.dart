import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../superheroes/superhero.dart';
import '../controllers/marvelcard_controller.dart';

class CustomScroll extends GetView<MarvelcardController> {
  const CustomScroll(this.superhero, {Key? key}) : super(key: key);
  final Superhero superhero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 450, // Set the height of the header when expanded
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color(superhero.rawColor),
                child: Column(
                  children: <Widget>[
                    // Add the background image
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      superhero.pathImage,
                      fit: BoxFit.cover,
                      height: 250,
                      width: 250,
                    ),
                    // Add the overlay with opacity
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    // Add the title with scaling and fading effect
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 16),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 1.0, end: 0.0),
                          duration: const Duration(milliseconds: 500),
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Transform.scale(
                              scale: 1 + value, // Scale factor for the title
                              child: Opacity(
                                opacity:
                                    1 - value, // Opacity factor for the title
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        superhero.name,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        superhero.heroName,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        superhero.description,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            // Other properties like pinned, floating, elevation, etc.
            // can be customized as needed
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Build the list of items
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'LATEST NEWS',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 0.0,
                            child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/en/f/f9/Spider-Man_Homecoming_poster.jpg',
                                    height: 180,
                                    width: 220,
                                    fit: BoxFit.fill,
                                  )),
                          ),
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'LATEST MOVIES',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 0.0,
                                  child: ClipRRect(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                      child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/en/f/f9/Spider-Man_Homecoming_poster.jpg',
                                        height: 220,
                                        width: 150,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
