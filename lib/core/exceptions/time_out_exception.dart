class TimeOutException implements Exception {
  final String message;
  TimeOutException({this.message = "Time Out Exception"});
}
