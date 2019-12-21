import 'dart:async';
import 'package:blaze_chat/common/common.dart';
import 'package:blaze_chat/models/login.dart';
import 'package:blaze_chat/services/account_api_provider.dart';
import 'package:blaze_chat/services/auth_api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  AuthApiProvider _authApiProvider = AuthApiProvider();
  AccountApiProvider _accountApiProvider = AccountApiProvider();

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _authApiProvider.getToken(username, password);
      if(response != null) {
        print(response);
        print('Response != null:'+response.toString());
        prefs.setInt('id', response.id);
        prefs.setString('name', response.firstname);
        prefs.setString('token', response.token);
        return response.token;
      } else {
        throw UserNotFoundException('Auth Error');
      }
    } catch (error, stacktrace){
      //print('Repository Catch:'+error.toString()+' '+stacktrace.toString());
      throw UserNotFoundException(error.toString());
    }
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final _token = prefs.getString('token');
    if (["", null, false, 0].contains(_token)) {
      return false;
    }
    if (_token.length > 0) {
      return true;
    }
    return false;
  }

  Future<String> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }
}
