import 'dart:convert';

import '../../../../core/core.dart';
import '../../assets.dart';

abstract class IAssetsDatasource {
  Future<List<LocationEntity>> getLocations(String companyId);
  Future<List<AssetEntity>> getAssets(String companyId);
}

class AssetsDatasource extends IAssetsDatasource {
  final IHttpRequestClient _httpClient;

  AssetsDatasource({required IHttpRequestClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<List<LocationEntity>> getLocations(String companyId) async {
    final response = await _httpClient.get(Endpoints.getLocations(companyId));

    if (response.statusCode == 200) {
      final result = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      return result.map((e) => LocationModel.fromMap(e)).toList();
    }
    throw Exception('Failed to load locations');
  }

  @override
  Future<List<AssetEntity>> getAssets(String companyId) async {
    final response = await _httpClient.get(Endpoints.getAssets(companyId));

    if (response.statusCode == 200) {
      final result = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      return result.map((e) => AssetModel.fromMap(e)).toList();
    }
    throw Exception('Failed to load assets');
  }
}
