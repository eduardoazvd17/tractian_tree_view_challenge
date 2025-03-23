import '../../../../core/core.dart';
import '../../assets.dart';

abstract class IGetAssetsUsecase {
  Future<Result<List<AssetEntity>, Failure>> call(String companyId);
}

class GetAssetsUsecase extends IGetAssetsUsecase {
  final IAssetsRepository _repository;

  GetAssetsUsecase({required IAssetsRepository repository})
    : _repository = repository;

  @override
  Future<Result<List<AssetEntity>, Failure>> call(String companyId) async {
    return await _repository.getAssets(companyId);
  }
}
