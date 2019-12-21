class Account {
  final String id;
  final String chapter_id;
  final String roadname;
  final String sat_training;
  final String status;
  final String type_id;
  //final String password;
  final String firstname;
  final String lastname;
  final String email;
  final String address;
  final String address2;
  final String city;
  final String state;
  final String zip;
  final String country;
  final String position;
  final String position_id;
  final String rank_id;
  final String rank;
  final String role;
  final String lastlogin;
  final String signature;
  final String avatar;
  final String modified;
  final String created;

  Account(this.id,this.chapter_id,this.roadname,this.sat_training,this.status,this.type_id,this.firstname,this.lastname,this.email,this.address,this.address2,this.city,this.state,
      this.zip,this.country,this.position,this.position_id,this.rank_id,this.rank,this.role,this.lastlogin,this.signature,this.avatar,this.modified,this.created);

  Account.fromJson(json)
    : id = json['id'],
      chapter_id = json['chapter_id'],
      roadname = json['roadname'],
      sat_training = json['sat_training'],
      status = json['status'],
      type_id = json['type_id'],
      firstname = json['firstname'],
      lastname = json['lastname'],
      email = json['email'],
      address = json['address'],
      address2 = json['address2'],
      city = json['city'],
      state = json['state'],
      zip = json['zip'],
      country = json['country'],
      position = json['position'],
      position_id = json['position_id'],
      rank_id = json['rank_id'],
      rank = json['rank'],
      role = json['role'],
      lastlogin = json['lastlogin'],
      signature = json['signature'],
      avatar = json['avatar'],
      modified = json['modified'],
      created = json['created'];
}