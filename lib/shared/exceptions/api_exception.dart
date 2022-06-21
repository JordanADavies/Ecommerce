class ApiException implements Exception {
  final int? code;

  ApiException({this.code});
}
