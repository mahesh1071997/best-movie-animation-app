
import 'package:booking/superheroes/superhero.dart';
import 'package:booking/superheroes/superhero_card.dart';
import 'package:flicked_cards/flicked_cards.dart';
import 'package:flutter/material.dart';

import '../app/modules/marvelcard/views/custome_scroll.dart';

class SuperheroesExample extends StatelessWidget {
  final CardAnimation cardAnimation;
  final String title;

  const SuperheroesExample({
    Key? key,
    required this.cardAnimation,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
              child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FlickedCards(
                      count: Superhero.marvelHeroes.length,
                      debug: false,
                      animationStyle: cardAnimation,
                      onSwiped: (idx, dir) => print('>>> $dir $idx'),
                      builder: (index, progress, context) {
                        final superHeroe = Superhero.marvelHeroes[index];
                        return GestureDetector(
                          onVerticalDragUpdate: (val){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  CustomScroll(superHeroe)));
                          },
                          child: Container(
                            child: Center(
                              child: SuperheroCard(
                                  superhero: superHeroe,
                                  factorChange: 1 - progress),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12,),
                ]),
          ))),
    );
  }
}
