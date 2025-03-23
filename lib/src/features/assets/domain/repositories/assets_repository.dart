import 'package:tractian/src/features/assets/assets.dart';

import '../../../../core/core.dart';

abstract class IAssetsRepository {
  Future<Result<List<LocationEntity>, Failure>> getLocations(String companyId);
  Future<Result<List<AssetEntity>, Failure>> getAssets(String companyId);
}
