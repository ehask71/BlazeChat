class Login {
  final String firstname;
  final String roadname;
  final String token;
  final String email;
  final String avatar;
  final int id;
  final String error;

  Login(this.firstname, this.roadname, this.token, this.email, this.id, this.avatar, this.error);

  Login.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        token = json['token'],
        email = json['email'],
        id = json['id'],
        roadname = json['roadname'],
        avatar = json['avatar'],
        error = json['error'];

  Map<String, dynamic> toJson() =>
      {
        'firstname': firstname,
        'roadname': roadname,
        'token': token,
        'email': email,
        'avatar': avatar,
        'id': id,
        'error': error
      };
}