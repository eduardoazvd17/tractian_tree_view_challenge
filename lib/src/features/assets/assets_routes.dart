import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../core/core.dart';
import 'assets.dart';

class AssetsRoutes {
  static List<GetPage> getRoutes() => [
    GetPage(
      name: AssetsPage.routeName,
      page: () => const AssetsPage(),
      bindings: [SharedBinding(), AssetsBinding()],
    ),
  ];
}
