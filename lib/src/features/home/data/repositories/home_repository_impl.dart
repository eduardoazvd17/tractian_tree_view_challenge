import 'package:tractian/src/features/home/home.dart';

import '../../../../core/core.dart';
import '../datasources/home_datasource.dart';

class HomeRepositoryImpl extends IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepositoryImpl({required IHomeDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Result<List<CompanyEntity>, Failure>> getCompanies() async {
    try {
      final companies = await _datasource.getCompanies();
      return Success(companies);
    } catch (e) {
      return Error(Failure(message: e.toString()));
    }
  }
}
