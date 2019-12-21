import 'package:blaze_chat/models/login.dart';
class LoginResponse {
  final List<Login> results;
  final String error;

  LoginResponse(this.results, this.error);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : results =
  (json["results"] as List).map((i) => new Login.fromJson(i)).toList(),
        error = "";

  LoginResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}