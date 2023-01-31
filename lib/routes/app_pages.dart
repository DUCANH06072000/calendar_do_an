import 'package:calendar_do_an/pages/home/binding/home_binding.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/routes/app_routes.dart';
import 'package:get/get.dart';
 class AppPages{
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
  ];
}