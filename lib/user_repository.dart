import 'dart:async';
import 'package:blaze_chat/common/common.dart';
import 'package:blaze_chat/models/login.dart';
import 'package:blaze_chat/services/account_api_provider.dart';
import 'package:blaze_chat/services/auth_api_provider.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  AuthApiProvider _authApiProvider = AuthApiProvider();
  AccountApiProvider _accountApiProvider = AccountApiProvider();

  Future<String> authenticate(String email, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _authApiProvider.getToken(email, password);
      print(response);
      if(response != null) {
        prefs.setInt('id', response.id);
        prefs.setString('name', response.firstname);
        prefs.setString('token', response.token);
        prefs.setString('roadname', response.roadname);
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
    print('UserRepository: getUser');
    return prefs.getString('roadname');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final _token = prefs.getString('token');
    if (_token.length > 0) {
      return _token;
    }
  }

  Future<bool> isSignedIn() async {
    print("isSignedIn called");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final _token = prefs.getString('token');
    if (["", null, false, 0].contains(_token)) {
      return false;
    }
    if (_token.length > 0) {
      var expTime = _authApiProvider.checkToken(_token);
      var expires = new DateTime.fromMillisecondsSinceEpoch(expTime * 1000);
      var now = DateTime.now();
      var isValid = now.compareTo(expires);
      print(isValid);
      if(isValid != -1){
        return false;
      }
      return true;
    }
    return false;
  }

  Future<String> signOut() async {
    this.deleteToken();
    return 'Logged Out';
  }
}
