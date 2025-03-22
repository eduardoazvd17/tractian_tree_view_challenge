import 'package:get/get.dart';
import 'package:tractian/src/core/utils/http_request_client.dart';

class SharedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttpRequestClient>(() => HttpRequestClient(), fenix: true);
  }
}
