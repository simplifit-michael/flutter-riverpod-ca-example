enum FailureCode {
  remoteData0,
  remoteDataU,
  remoteData400,
  remoteData401,
  remoteData500,
  localData0,
  domain1,
  domain2,
  domain3,
}
extension FailureCodeMessage on FailureCode{
  String getMessage(){
    switch(this){
      case FailureCode.remoteData0:
        return 'No Internet Connection';
      case FailureCode.remoteDataU:
        return 'Unknown Reason';
      case FailureCode.remoteData400:
        return 'Request Failed';
      case FailureCode.remoteData401:
        return 'Authentication Failed';
      case FailureCode.remoteData500:
        return 'Internal Error';
      case FailureCode.localData0:
        return 'No Data';
      case FailureCode.domain1:
        return '';
      case FailureCode.domain2:
        return '';
      case FailureCode.domain3:
        return '';
    }
  }
}
