import 'package:get/get.dart';

import '../../assets.dart';

class AssetsController extends GetxController {
  final AssetsPageArguments arguments;
  final IGetLocationsUsecase _getLocationsUsecase;
  final IGetAssetsUsecase _getAssetsUsecase;

  AssetsController({
    required this.arguments,
    required IGetLocationsUsecase getLocationsUsecase,
    required IGetAssetsUsecase getAssetsUsecase,
  }) : _getLocationsUsecase = getLocationsUsecase,
       _getAssetsUsecase = getAssetsUsecase;

  @override
  void onInit() {
    loadLocationsAndAssets();
    super.onInit();
  }

  final RxString searchText = RxString('');
  final RxBool isEnergySensorSelected = RxBool(false);
  final RxBool isCriticalSelected = RxBool(false);
  final RxBool isLoading = RxBool(false);
  final RxString errorMessage = RxString('');
  final RxList<LocationEntity> locations = RxList<LocationEntity>();
  final RxList<AssetEntity> assets = RxList<AssetEntity>();

  List<TreeItemEntity> get itemsWithoutParent => [
    ...locations.where((location) => location.parentId == null),
    ...assets.where((asset) => asset.parentId == null),
  ];

  List<TreeItemEntity> getChildrenItems(TreeItemEntity item) => [
    ...locations.where((location) => location.parentId == item.id),
    ...assets.where((asset) => asset.parentId == item.id),
  ];

  void onSearchTextChanged(String value) => searchText.value = value;

  void toggleEnergySensorSelected() =>
      isEnergySensorSelected.value = !isEnergySensorSelected.value;

  void toggleCriticalSelected() =>
      isCriticalSelected.value = !isCriticalSelected.value;

  Future<void> loadLocationsAndAssets() async {
    isLoading.value = true;
    errorMessage.value = '';
    await Future.wait([_getLocations(), _getAssets()]);
    isLoading.value = false;
  }

  Future<void> _getLocations() async {
    final result = await _getLocationsUsecase(arguments.companyId);
    result.fold(
      onSuccess: locations.assignAll,
      onError: (error) => errorMessage.value = error.message,
    );
  }

  Future<void> _getAssets() async {
    final result = await _getAssetsUsecase(arguments.companyId);
    result.fold(
      onSuccess: assets.assignAll,
      onError: (error) => errorMessage.value = error.message,
    );
  }
}
