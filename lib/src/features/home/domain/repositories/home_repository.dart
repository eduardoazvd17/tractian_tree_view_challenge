import '../../../../core/core.dart';
import '../../home.dart';

abstract class IHomeRepository {
  Future<Result<List<CompanyEntity>, Failure>> getCompanies();
}
