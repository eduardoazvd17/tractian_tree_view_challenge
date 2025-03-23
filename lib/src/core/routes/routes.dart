import 'package:get/get.dart';

import '../../features/features.dart';

class Routes {
  static String get initialRoute => HomePage.routeName;

  static List<GetPage> getRoutes() => [
    ...HomeRoutes.getRoutes(),
    ...AssetsRoutes.getRoutes(),
  ];
}
