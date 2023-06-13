// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
  AuthService authService = AuthService();
  RegistrationResponse? registrationResponse = await authService.registration("asdfqwer", "asdfqwer", "", "asdfqwer@green.com");
  if (registrationResponse != null) {
    if (registrationResponse.email != null) {
      registrationResponse.email!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.username != null) {
      registrationResponse.username!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.non_field_errors != null) {
      registrationResponse.non_field_errors!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.password1 != null) {
      registrationResponse.password1!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.key != null) {
      print(registrationResponse.key!);
    }
  }
}

class AuthService {
  final registrationUri = Uri.parse("http://127.0.0.1:8000/registration/");
  final loginUri = Uri.parse("http://127.0.0.1:8000/accounts/login/");

  Future<RegistrationResponse?> registration(String username, String password1, String password2, String email) async {
    var response = await http.post(registrationUri, body: {
      "username": username,
      "password1": password1,
      "password2": password2,
      "email": email,
    });
    print(response.body);
    return RegistrationResponse.fromJson(jsonDecode(response.body));
  }
}

class RegistrationResponse {
  List<dynamic>? non_field_errors;
  List<dynamic>? password1;
  List<dynamic>? email;
  List<dynamic>? username;
  dynamic? key;

  RegistrationResponse({
    this.email,
    this.key,
    this.non_field_errors,
    this.password1,
    this.username,
  });

  factory RegistrationResponse.fromJson(mapOfBody) {
    return RegistrationResponse(
      email: mapOfBody["email"],
      key: mapOfBody["key"],
      non_field_errors: mapOfBody["non_field_errors"],
      password1: mapOfBody["password1"],
      username: mapOfBody["username"],
    );
  }
}
