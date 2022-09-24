import 'package:dio/dio.dart';
import 'package:ricknmorty/src/core/failure/failure_code.dart';

import 'failure.dart';

class DataFailure extends Failure {
  @override
  late final FailureCode code;

  DataFailure(this.code);

  DataFailure.build(Exception e) {
    if (e is DioError) {
      if (e.response?.statusCode == null) {
        code = FailureCode.remoteData0;
      } else if (e.response?.statusCode == 400) {
        code = FailureCode.remoteData400;
      } else if (e.response?.statusCode == 401) {
        code = FailureCode.remoteData401;
      } else if (e.response?.statusCode == 500) {
        code = FailureCode.remoteData500;
      }
    } else {
      code = FailureCode.remoteDataU;
    }
  }
}
