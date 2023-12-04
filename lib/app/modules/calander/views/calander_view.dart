import 'package:booking/app/modules/calander/controllers/calander_controller.dart';
import 'package:booking/app/modules/calander/views/calander_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../demo-card.dart';

class CalanderView extends GetView<CalanderController> {
  CalanderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Yoga",
      "Push-ups",
      "Cardio",
      "Acrobatics",
      "Coco",
      "HiiT",
      "Strength",
      "Outdoors",
      "Gym",
      "Athletes",
    ];

    final List<String> titlesImages = [
      'assets/img/propic.jpeg',
      'assets/img/course3.jpg',
      'assets/img/course1.jpg',
      'assets/img/course3.jpg',
      'assets/img/propic.jpeg',
      'assets/img/course1.jpg',
      'assets/img/propic.jpeg',
      'assets/img/course3.jpg',
      'assets/img/propic.jpeg',
      'assets/img/course1.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: PageListviewPre(
          visualizedItem: 5,onTapFrontItem: (val){
          Get.to(() => CalanderCard(index:0));
        },
          itemExtent: MediaQuery.of(context).size.height * .26,
          initialIndex: 5,
          backItemShadowColor: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.all(10),
          children: List.generate(
            titles.length,
            (index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(titlesImages[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      titles[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
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
  ];
}

class AnimatedCardList extends StatefulWidget {
  @override
  _AnimatedCardListState createState() => _AnimatedCardListState();
}

final List<String> titles = [
  "Yoga",
  "Push-ups",
  "Cardio",
  "Acrobatics",
  "Coco",
  "HiiT",
  "Strength",
  "Outdoors",
  "Gym",
  "Athletes",
];

final List<String> titlesImages = [
  'assets/img/propic.jpeg',
  'assets/img/course3.jpg',
  'assets/img/course1.jpg',
  'assets/img/course3.jpg',
  'assets/img/propic.jpeg',
  'assets/img/course1.jpg',
  'assets/img/propic.jpeg',
  'assets/img/course3.jpg',
  'assets/img/propic.jpeg',
  'assets/img/course1.jpg',
];

class _AnimatedCardListState extends State<AnimatedCardList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<bool> _isCardVisible = List.generate(titles.length, (index) => false);

  @override
  void initState() {
    super.initState();
    _animateCards();
  }

  void _animateCards() async {
    for (int i = 0; i < titles.length; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _isCardVisible[i] = true;
      });
      _listKey.currentState!.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _isCardVisible.length,
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation,
          child: Hero(
            tag: 'card${titles[index]}', // Unique tag for each card
            child: Material(
              child: InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(titlesImages[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        titles[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
