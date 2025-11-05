abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException({required this.message, this.stackTrace});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException({required super.message, super.stackTrace});
}

class CacheException extends AppException {
  const CacheException({required super.message, super.stackTrace});
}

class NetworkException extends AppException {
  const NetworkException({required super.message, super.stackTrace});
}

class ValidationException extends AppException {
  const ValidationException({required super.message, super.stackTrace});
}
