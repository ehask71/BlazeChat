import 'package:blaze_chat/models/account.dart';
class AccountResponse {
  final List<Account> results;
  final String error;

  AccountResponse(this.results, this.error);

  AccountResponse.fromJson(Map<String, dynamic> json)
      : results =
  (json["results"] as List).map((i) => new Account.fromJson(i)).toList(),
        error = "";

  AccountResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}