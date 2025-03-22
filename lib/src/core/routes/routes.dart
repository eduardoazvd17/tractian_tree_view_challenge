import 'package:get/get.dart';

import '../../features/home/home.dart';

class Routes {
  static String get initialRoute => HomePage.routeName;

  static List<GetPage> getRoutes() => [...HomeRoutes.getRoutes()];
}
