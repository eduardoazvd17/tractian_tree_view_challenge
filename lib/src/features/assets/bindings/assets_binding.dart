import 'package:get/get.dart';

import '../assets.dart';

class AssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAssetsDatasource>(() {
      return AssetsDatasource(httpClient: Get.find());
    });

    Get.lazyPut<IAssetsRepository>(() {
      return AssetsRepository(datasource: Get.find());
    });

    Get.lazyPut<IGetLocationsUsecase>(() {
      return GetLocationsUsecase(repository: Get.find());
    });

    Get.lazyPut<IGetAssetsUsecase>(() {
      return GetAssetsUsecase(repository: Get.find());
    });

    Get.lazyPut(() {
      return AssetsController(
        arguments: Get.arguments as AssetsPageArguments,
        getLocationsUsecase: Get.find(),
        getAssetsUsecase: Get.find(),
      );
    });
  }
}
