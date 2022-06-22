class ApiException implements Exception {
  final int? code;

  ApiException({this.code});

  @override
  String toString() => '$code Error!';
}
