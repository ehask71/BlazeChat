class Login {
  final String firstname;
  final String token;
  final String email;
  final int id;
  final String error;

  Login(this.firstname, this.token, this.email, this.id,this.error);

  Login.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        token = json['token'],
        email = json['email'],
        id = json['id'],
        error = json['error'];

  Map<String, dynamic> toJson() =>
      {
        'firstname': firstname,
        'token': token,
        'email': email,
        'id': id,
        'error': error
      };
}