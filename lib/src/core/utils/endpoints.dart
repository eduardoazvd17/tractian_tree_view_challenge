class Endpoints {
  static const String _baseUrl = 'https://fake-api.tractian.com';

  static const String getCompanies = '$_baseUrl/companies';
  static String getLocations(String companyId) =>
      '$_baseUrl/companies/$companyId/locations';
  static String getAssets(String companyId) =>
      '$_baseUrl/companies/$companyId/assets';
}
