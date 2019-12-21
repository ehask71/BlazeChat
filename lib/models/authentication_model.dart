class AuthenticationModel {
  final String firstname;
  final String token;
  final String email;
  final int userId;

  AuthenticationModel(this.firstname, this.token, this.email, this.userId);

  AuthenticationModel.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        token = json['token'],
        email = json['email'],
        userId = json['id'];

  Map<String, dynamic> toJson() =>
      {
        'firstname': firstname,
        'token': token,
        'email': email,
        'userId': userId,
      };
}