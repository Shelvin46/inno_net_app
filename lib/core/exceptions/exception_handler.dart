import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inno_net_app/core/constants/base_bloc_states.dart';
import 'package:inno_net_app/core/failures/failures.dart';

class CustomExceptionHandler implements Exception {
  static Failure handleException(DioException e) {
    if (e.error is TimeoutException) {
      return const CustomTimeoutException(message: "Timeout Exception");
    } else if (e.error is FormatException) {
      return const ParsingException(message: "Invalid Format");
    } else if (e.error is HttpException) {
      return const APIException(message: "Invalid Request");
    } else if (e.error is SocketException) {
      return const NetworkException(message: "Server Error");
    } else {
      return const Failure(message: "An error occurred");
    }
  }

  static Map<String, dynamic> handleExceptionToMap(Failure e) {
    if (e is CustomTimeoutException) {
      return {
        "error": "Timeout Error",
      };
    } else if (e is ParsingException) {
      return {
        "error": "Invalid Format",
      };
    } else if (e is APIException) {
      return {
        "error": "Invalid Request",
      };
    } else if (e is NetworkException) {
      return {
        "error": "No internet",
      };
    } else {
      return {
        "error": "Something went wrong",
      };
    }
  }

  static Map<String, dynamic> exceptions = {
    "Timeout Error": const TimeoutErrorState(
      message: "Timeout Error occurred try again later",
    ),
    "Invalid Format": const ParsingErrorState(
      message: "Invalid Format please try again later",
    ),
    "Invalid Request": const FormatExceptionState(
      message: "Invalid Request please try again later",
    ),
    "No internet": const NoInternetState(
      message: "Check your internet connection",
    ),
    "Something went wrong": const ServerErrorState(
      message: "Something went wrong please try again later",
    )
  };
}
