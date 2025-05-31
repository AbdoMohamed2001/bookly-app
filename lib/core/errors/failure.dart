import 'package:dio/dio.dart';

class Failure {
  final String failMessage;
  Failure(this.failMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.failMessage);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');

      case DioExceptionType.badResponse:
        return ServerFailure('Bad Response');

      case DioExceptionType.cancel:
        return ServerFailure('Canceled Request');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');

      case DioExceptionType.unknown:
        return ServerFailure('Unknown Error !');
    }
  }
}
