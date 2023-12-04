import 'package:get/get.dart';

import '../modules/bookingui/bindings/bookingui_binding.dart';
import '../modules/bookingui/views/bookingui_view.dart';
import '../modules/budget/bindings/budget_binding.dart';
import '../modules/budget/views/budget_view.dart';
import '../modules/calander/bindings/calander_binding.dart';
import '../modules/calander/views/calander_view.dart';
import '../modules/clock/bindings/clock_binding.dart';
import '../modules/clock/views/clock_view.dart';
import '../modules/dictionary/bindings/dictionary_binding.dart';
import '../modules/dictionary/views/dictionary_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/marvelcard/bindings/marvelcard_binding.dart';
import '../modules/marvelcard/views/marvelcard_view.dart';
import '../modules/tabbarview/bindings/tabbarview_binding.dart';
import '../modules/tabbarview/views/tabbarview_view.dart';
import '../modules/todoapp/bindings/todoapp_binding.dart';
import '../modules/todoapp/views/todoapp_view.dart';
import '../modules/watchui/bindings/watchui_binding.dart';
import '../modules/watchui/views/watchui_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DICTIONARY;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MARVELCARD,
      page: () => MarvelcardView(),
      binding: MarvelcardBinding(),
    ),
    GetPage(
      name: _Paths.CALANDER,
      page: () => CalanderView(),
      binding: CalanderBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGUI,
      page: () => const BookinguiView(),
      binding: BookinguiBinding(),
    ),
    GetPage(
      name: _Paths.TODOAPP,
      page: () => const TodoappView(),
      binding: TodoappBinding(),
    ),
    GetPage(
      name: _Paths.BUDGET,
      page: () => const BudgetView(),
      binding: BudgetBinding(),
    ),
    GetPage(
      name: _Paths.TABBARVIEW,
      page: () => const TabbarviewView(),
      binding: TabbarviewBinding(),
    ),
    GetPage(
      name: _Paths.WATCHUI,
      page: () => const WatchuiView(),
      binding: WatchuiBinding(),
    ),
    GetPage(
      name: _Paths.DICTIONARY,
      page: () => const DictionaryView(),
      binding: DictionaryBinding(),
    ),
    GetPage(
      name: _Paths.CLOCK,
      page: () => const ClockView(),
      binding: ClockBinding(),
    ),
  ];
}
