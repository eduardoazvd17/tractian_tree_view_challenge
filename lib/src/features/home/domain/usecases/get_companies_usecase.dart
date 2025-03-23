import '../../../../core/core.dart';
import '../../home.dart';

abstract class IGetCompaniesUsecase {
  Future<Result<List<CompanyEntity>, Failure>> call();
}

class GetCompaniesUsecase extends IGetCompaniesUsecase {
  final IHomeRepository _repository;

  GetCompaniesUsecase({required IHomeRepository repository})
    : _repository = repository;

  @override
  Future<Result<List<CompanyEntity>, Failure>> call() async {
    return await _repository.getCompanies();
  }
}
