import 'dart:convert';

import '../../../../core/core.dart';
import '../../home.dart';

abstract class IHomeDatasource {
  Future<List<CompanyModel>> getCompanies();
}

class HomeDatasource extends IHomeDatasource {
  final IHttpRequestClient _httpClient;

  HomeDatasource({required IHttpRequestClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final response = await _httpClient.get(Endpoints.getCompanies);
    if (response.statusCode == 200) {
      final result = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      return result.map((e) => CompanyModel.fromMap(e)).toList();
    }
    throw Exception('Failed to load companies');
  }
}
