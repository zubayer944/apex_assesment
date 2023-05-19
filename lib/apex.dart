import 'package:appex_assesment/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'domain/utilities/app_info.dart';
import 'domain/utilities/initializer.dart';

class Apex extends StatelessWidget{
  const Apex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: AppInfo.appName,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
    );
  }
}