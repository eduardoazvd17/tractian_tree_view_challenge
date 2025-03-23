import '../../../../core/core.dart';
import '../../assets.dart';

abstract class IGetLocationsUsecase {
  Future<Result<List<LocationEntity>, Failure>> call(String companyId);
}

class GetLocationsUsecase extends IGetLocationsUsecase {
  final IAssetsRepository _repository;

  GetLocationsUsecase({required IAssetsRepository repository})
    : _repository = repository;

  @override
  Future<Result<List<LocationEntity>, Failure>> call(String companyId) async {
    return await _repository.getLocations(companyId);
  }
}
