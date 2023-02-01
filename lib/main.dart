import 'package:calendar_do_an/pages/home/binding/home_binding.dart';
import 'package:calendar_do_an/pages/main/binding/main_binding.dart';
import 'package:calendar_do_an/resources/style/color.dart';
import 'package:calendar_do_an/routes/app_pages.dart';
import 'package:calendar_do_an/routes/app_routes.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

String? fcmToken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //disable Landscape
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US'), ],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('vi', 'VN'),
        child: const MyApp()
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState()  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.MAIN,
      initialBinding: MainBinding(),
      theme: AppTheme.getAppTheme(),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        return MediaQuery(
          child: Container(child: child,),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
    );
  }
}


class AppTheme {
  static ThemeData getAppTheme(){
    return ThemeData(
        primaryColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.white,
        fontFamily: "RobotoRegular",
        backgroundColor: AppColor.white
    );
  }
}
