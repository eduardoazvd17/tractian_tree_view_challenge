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
  final RxSet<String> _expandedItemsIds = RxSet<String>();

  bool isItemExpanded(String itemId) => _expandedItemsIds.contains(itemId);

  void toggleIsItemExpanded(String itemId) {
    _expandedItemsIds.contains(itemId)
        ? _expandedItemsIds.remove(itemId)
        : _expandedItemsIds.add(itemId);
  }

  List<TreeItemEntity> getChildrenItems(TreeItemEntity item) =>
      _itemsWithParent.where((i) => i.parentId == item.id).toList();

  void _filterItems() {
    final List<TreeItemEntity> allItems = [..._locations, ..._assets];
    final Set<TreeItemEntity> filteredItems = {};

    final bool hasFilters =
        searchText.value.isNotEmpty ||
        isEnergySensorSelected.value ||
        isCriticalSelected.value;

    if (hasFilters) {
      for (final item in allItems) {
        bool matchesFilter = false;
        if (!matchesFilter && searchText.value.isNotEmpty) {
          matchesFilter = item.name.toLowerCase().contains(
            searchText.value.toLowerCase().trim(),
          );
        }
        if (!matchesFilter &&
            isEnergySensorSelected.value &&
            item is AssetEntity) {
          matchesFilter = item.isOperatingStatus;
        }
        if (!matchesFilter && isCriticalSelected.value && item is AssetEntity) {
          matchesFilter = item.isAlertStatus;
        }

        if (matchesFilter) {
          filteredItems.add(item);
          String? currentParentId = item.parentId;
          while (currentParentId != null) {
            final parent = allItems.firstWhere(
              (i) => i.id == currentParentId,
              orElse: () => throw Exception('Parent not found'),
            );
            filteredItems.add(parent);
            currentParentId = parent.parentId;
          }
        }
      }
    } else {
      filteredItems.addAll(allItems);
    }

    itemsWithoutParent.assignAll(
      filteredItems.where((item) => item.parentId == null).toList(),
    );
    _itemsWithParent.assignAll(
      filteredItems.where((item) => item.parentId != null).toList(),
    );

    itemsWithoutParent.sort((a, b) => a.name.compareTo(b.name));
    _itemsWithParent.sort((a, b) => a.name.compareTo(b.name));
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
