import 'package:booking/app/modules/bookingui/views/modelHero.dart';
import 'package:get/get.dart';

import '../../../../superheroes/superhero.dart';

class BookinguiController extends GetxController {
  //TODO: Implement BookinguiController

  final count = 0.obs;
  late  SuperheroName? superHero= const SuperheroName(
      heroName: 'Kunon Buffet',
      name: 'Parker Jenifer',
      description:
      'With more countries landing on the Moon, people back on Earth will have to think about what happens to all the landers, waste and miscellaneous debris left on the lunar surface and in orbit.',
      pathImage: 'assets/img/course1.jpg',
      rawColor: 0xffA41209);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
