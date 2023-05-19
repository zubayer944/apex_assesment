import 'package:appex_assesment/presentation/pages/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/pages/Binding/home_binding.dart';
part 'app_routes.dart';



class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
