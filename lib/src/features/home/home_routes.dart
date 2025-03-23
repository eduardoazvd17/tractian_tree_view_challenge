import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home.dart';

class HomeRoutes {
  static List<GetPage> getRoutes() => [
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
