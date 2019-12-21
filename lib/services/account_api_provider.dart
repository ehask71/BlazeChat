import 'package:blaze_chat/models/account_response.dart';
import 'package:blaze_chat/services/api_provider.dart';
import 'package:http/http.dart' as http;

class AccountApiProvider {
  final String _endpoint = 'https://api.ironlegacymc.com/api/accounts/';
  Future<AccountResponse> getUser() async {
    try {
      final response = http.post(_endpoint);
    } catch (error, stacktrace){

    }
  }
}