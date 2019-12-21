import 'dart:convert';
import 'package:blaze_chat/common/common.dart';
import 'package:blaze_chat/models/login.dart';
import 'package:http/http.dart' as http;

class AuthApiProvider {
  final String _endpoint = 'https://api.ironlegacymc.com/api/auth/login';
  Future<dynamic> getToken(username, password) async {
    try {
      Map<String, String> body = {
        'email': username.trim(),
        'password': password.trim(),
      };
      final response = await http.post(
        _endpoint,
        body: body,
      );
      print(response.body);

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        var user = new Login.fromJson(responseJson);
        return user;
      } else {
        final responseJson = json.decode(response.body);
        throw UserNotFoundException(responseJson['error']);
      }
    } catch (error){
      throw UserNotFoundException(error.toString());
    }
  }
}