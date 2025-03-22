import 'dart:io';

import 'package:get/get.dart';

class SharedBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpClient(), fenix: true);
  }
}
