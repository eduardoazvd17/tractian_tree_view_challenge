import 'package:get/get.dart';
import 'package:tractian/src/features/home/data/datasources/home_datasource.dart';

import '../home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeDatasource>(() => HomeDatasource(httpClient: Get.find()));

    Get.lazyPut<IHomeRepository>(() {
      return HomeRepositoryImpl(datasource: Get.find());
    });

    Get.lazyPut<IGetCompaniesUsecase>(() {
      return GetCompaniesUsecase(repository: Get.find());
    });

    Get.lazyPut(() => HomeController(getCompaniesUsecase: Get.find()));
  }
}
