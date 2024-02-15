import 'package:equatable/equatable.dart';

class FormFieldValidateClass {
  // validate password

  String? validatePassword(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password should contain at least one special character';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password should contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password should contain at least one number';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password should contain at least one lowercase letter';
    }
    return null;
  }

  //validate email
  String? isValidEmail(String? value) {
    value = value?.trim();
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value ?? '')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // validate name
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }

  // validate otp
  String? validateOtp(String? otp) {
    // A valid OTP is a string of exactly 6 digits
    // final RegExp otpRegex = RegExp(r'^\d{4}$');
    if (otp == null || otp.isEmpty) {
      return "Enter the OTP";
    } else if (otp.length != 4) {
      return "Invalid OTP";
    }
    return null;
  }
}

///[UserEntity] is a class that is used to register a user with email and password.
///It takes in a [name], [email], and [password] parameter
///It has a [props] method that returns a list of the name and email
///It has a [==] method that returns a boolean value
///It has a [hashCode] method that returns the hashcode of the name and email
///It has a [toString] method that returns the name and email
///It has a [copyWith] method that returns a new instance of the [UserEntity] class
///It has a [toJson] method that returns a map of the name, email, and password
///It has a [fromJson] method that returns a new instance of the [UserEntity] class

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  const UserEntity(
      {required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];

  @override
  bool get stringify => true;

  UserEntity copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
