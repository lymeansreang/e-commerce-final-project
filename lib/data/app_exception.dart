class AppException implements Exception{

  final _prefix;
  final _message;


  AppException([this._prefix,this._message]);

  @override
  String toString() {
    return 'AppException{_prefix: $_prefix, _message: $_message}';
  }
}

class FetchDataException extends AppException{
  FetchDataException(String message):super('Error during communication',message);
}
class BedRequestException extends AppException{
  BedRequestException(String message):super('YOur request model is not right',message);
}