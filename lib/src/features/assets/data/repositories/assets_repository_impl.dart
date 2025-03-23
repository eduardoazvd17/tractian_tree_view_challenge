import 'package:tractian/src/core/errors/failure.dart';

import 'package:tractian/src/core/utils/result.dart';

import '../../assets.dart';

class AssetsRepository extends IAssetsRepository {
  final IAssetsDatasource _datasource;

  AssetsRepository({required IAssetsDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Result<List<AssetEntity>, Failure>> getAssets(String companyId) async {
    try {
      final result = await _datasource.getAssets(companyId);
      return Success(result);
    } catch (e) {
      return Error(Failure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<LocationEntity>, Failure>> getLocations(
    String companyId,
  ) async {
    try {
      final result = await _datasource.getLocations(companyId);
      return Success(result);
    } catch (e) {
      return Error(Failure(message: e.toString()));
    }
  }
}
