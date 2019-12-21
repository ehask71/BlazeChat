import 'dart:convert';
import 'package:blaze_chat/common/common.dart';
import 'package:blaze_chat/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:jaguar_jwt/jaguar_jwt.dart';

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
        final expires = checkToken(user.token);
        print("Expires:"+expires.toString());
        return user;
      } else {
        final responseJson = json.decode(response.body);
        throw UserNotFoundException(responseJson['error']);
      }
    } catch (error){
      throw UserNotFoundException(error.toString());
    }
  }

  int checkToken(String token){
    final parts = token.split('.');
    final payload = parts[1];
    final String decoded = B64urlEncRfc7515.decodeUtf8(payload);
    final payloadMap = jsonDecode(decoded);

    print(payloadMap);
    return payloadMap['exp'];
  }
}