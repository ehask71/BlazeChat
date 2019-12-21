class GroupModel {
  final String id;
  final String title;
  final String image;
  final String status;
  final String created;

  GroupModel.fromJson(json)
    : id = json['id'],
      title = json['title'],
      image = json['image'],
      status = json['status'],
      created = json['created'];
}