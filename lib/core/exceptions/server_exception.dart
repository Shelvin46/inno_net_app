///[ServerException] is a custom exception class that extends [Exception] class.
///It takes in a [message] parameter which is a string
///
class ServerException implements Exception {
  final String message;
  ServerException({this.message = "Server Exception"});
}
