import 'package:get/get.dart';

import '../../home.dart';

class HomeController extends GetxController {
  final IGetCompaniesUsecase _getCompaniesUsecase;

  HomeController({required IGetCompaniesUsecase getCompaniesUsecase})
    : _getCompaniesUsecase = getCompaniesUsecase;

  final RxBool isLoading = RxBool(false);
  final RxString errorMessage = RxString('');
  final RxList<CompanyEntity> companies = RxList<CompanyEntity>();

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  Future<void> getCompanies() async {
    isLoading.value = true;
    errorMessage.value = '';
    final result = await _getCompaniesUsecase();
    result.fold(
      onSuccess: companies.assignAll,
      onError: (error) => errorMessage.value = error.message,
    );
    isLoading.value = false;
  }
}
