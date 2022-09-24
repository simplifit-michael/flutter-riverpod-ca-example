import 'package:ricknmorty/src/core/failure/failure_code.dart';

abstract class Failure {
  String get message => code.getMessage();
  abstract final FailureCode code;
}
