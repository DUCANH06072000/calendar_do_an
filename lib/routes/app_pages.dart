import 'package:calendar_do_an/pages/alljob/binding/job_binding.dart';
import 'package:calendar_do_an/pages/alljob/view/job_screen.dart';
import 'package:calendar_do_an/pages/gpt/binding/gpt_binding.dart';
import 'package:calendar_do_an/pages/gpt/view/gpt_screen.dart';
import 'package:calendar_do_an/pages/home/binding/home_binding.dart';
import 'package:calendar_do_an/pages/home/view/home_screen.dart';
import 'package:calendar_do_an/pages/jobdone/binding/jobdone_binding.dart';
import 'package:calendar_do_an/pages/jobdone/view/jobdone_screen.dart';
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
          GetPage(
              name: Routes.GPT, page: () => GptScreen(), binding: GptBinding()),
        ]),
    GetPage(
        name: Routes.JOBDONE,
        page: () => JobDoneScreen(),
        binding: JobDoneBinding()),
    GetPage(name: Routes.JOB, page: () => JobScreen(), binding: JobBinding())
  ];
}
