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
  final RxList<LocationEntity> _locations = RxList<LocationEntity>();
  final RxList<AssetEntity> _assets = RxList<AssetEntity>();
  final RxList<TreeItemEntity> itemsWithoutParent = RxList<TreeItemEntity>();
  final RxList<TreeItemEntity> _itemsWithParent = RxList<TreeItemEntity>();

  List<TreeItemEntity> getChildrenItems(TreeItemEntity item) =>
      _itemsWithParent.where((i) => i.parentId == item.id).toList();

  void _filterItems() {
    itemsWithoutParent.assignAll([
      ..._locations.where((location) => location.parentId == null),
      ..._assets.where((asset) => asset.parentId == null),
    ]);
    _itemsWithParent.assignAll([
      ..._locations.where((location) => location.parentId != null),
      ..._assets.where((asset) => asset.parentId != null),
    ]);
  }

  void onSearchTextChanged(String value) {
    searchText.value = value;
    _filterItems();
  }

  void toggleEnergySensorSelected() {
    isEnergySensorSelected.value = !isEnergySensorSelected.value;
    _filterItems();
  }

  void toggleCriticalSelected() {
    isCriticalSelected.value = !isCriticalSelected.value;
    _filterItems();
  }

  Future<void> loadLocationsAndAssets() async {
    isLoading.value = true;
    errorMessage.value = '';
    await Future.wait([_getLocations(), _getAssets()]);
    _filterItems();
    isLoading.value = false;
  }

  Future<void> _getLocations() async {
    final result = await _getLocationsUsecase(arguments.companyId);
    result.fold(
      onSuccess: _locations.assignAll,
      onError: (error) => errorMessage.value = error.message,
    );
  }

  Future<void> _getAssets() async {
    final result = await _getAssetsUsecase(arguments.companyId);
    result.fold(
      onSuccess: _assets.assignAll,
      onError: (error) => errorMessage.value = error.message,
    );
  }
}
