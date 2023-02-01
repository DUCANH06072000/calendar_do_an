import 'package:calendar_do_an/pages/home/binding/home_binding.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/pages/main/binding/main_binding.dart';
import 'package:calendar_do_an/pages/main/view/main_screen.dart';
import 'package:calendar_do_an/pages/utilities/binding/utilities_binding.dart';
import 'package:calendar_do_an/pages/utilities/view/utilities_screen.dart';
import 'package:calendar_do_an/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.MAIN,
        page: () => MainScreen(),
        binding: MainBinding(),
        children: [
          GetPage(
              name: Routes.HOME,
              page: () => HomeScreen(),
              binding: HomeBinding()),
          GetPage(
              name: Routes.UTILITIES,
              page: () => UtilitiesScreen(),
              binding: UtilitiesBinding()),
        ]),
  ];
}
