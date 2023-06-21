import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import  'app/routes/app_pages.dart';
import 'app/shared/theme/theme.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Anarise",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: themeData
    ),


    
  );
}
