import 'package:booking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    key: UniqueKey(),
    debugShowCheckedModeBanner: false,
  ));
}



