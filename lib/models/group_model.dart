class GroupModel {
  final String id;
  final String title;
  final String image;
  final String status;
  final String created;

  GroupModel(this.id, this.title, this.image, this.status, this.created);

  GroupModel.fromJson(json)
      : id = json['id'],
        title = json['title'],
        image = json['image'],
        status = json['status'],
        created = json['created'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'status': status,
        'created': created,
      };
}
